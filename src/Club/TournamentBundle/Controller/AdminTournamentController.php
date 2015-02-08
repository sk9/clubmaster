<?php

namespace Club\TournamentBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\RedirectResponse;

/**
 * @Route("/admin/tournament/tournament")
 */
class AdminTournamentController extends Controller
{
  /**
   * @Route("")
   * @Template()
   */
  public function indexAction()
  {
    $em = $this->getDoctrine()->getManager();
    $tournaments = $em->getRepository('ClubTournamentBundle:Tournament')->findAll();

    return array(
      'tournaments' => $tournaments
    );
  }

  /**
   * @Route("/new")
   * @Template()
   */
  public function newAction()
  {
    $start_time = new \DateTime(date('Y-m-d 15:00:00'));
    $i = new \DateInterval('P1M');
    $start_time->add($i);

    $tournament = new \Club\TournamentBundle\Entity\Tournament();
    $tournament->setStartTime($start_time);
    $tournament->setMinAttend(4);

    $res = $this->process($tournament);

    if ($res instanceOf RedirectResponse)

      return $res;

    return array(
      'form' => $res->createView()
    );
  }

  /**
   * @Route("/edit/{id}")
   * @Template()
   */
  public function editAction($id)
  {
    $em = $this->getDoctrine()->getManager();
    $tournament = $em->find('ClubTournamentBundle:Tournament',$id);

    $res = $this->process($tournament);

    if ($res instanceOf RedirectResponse)

      return $res;

    return array(
      'tournament' => $tournament,
      'form' => $res->createView()
    );
  }

  /**
   * @Route("/delete/{id}")
   */
  public function deleteAction($id)
  {
    try {
      $em = $this->getDoctrine()->getManager();
      $tournament = $em->find('ClubTournamentBundle:Tournament',$this->getRequest()->get('id'));

      $em->remove($tournament);
      $em->flush();

      $this->get('club_extra.flash')->addNotice();

    } catch (\PDOException $e) {
      $this->get('session')->getFlashBag()->add('error', $this->get('translator')->trans('You cannot delete tournament which is already being used.'));
    }

    return $this->redirect($this->generateUrl('club_tournament_admintournament_index'));
  }

  protected function process($tournament)
  {
    $form = $this->createForm(new \Club\TournamentBundle\Form\Tournament(), $tournament);

    if ($this->getRequest()->getMethod() == 'POST') {
      $form->bind($this->getRequest());
      if ($form->isValid()) {
        $em = $this->getDoctrine()->getManager();
        $em->persist($tournament);
        $em->flush();

        $this->get('club_extra.flash')->addNotice();

        return $this->redirect($this->generateUrl('club_tournament_admintournament_index'));
      }
    }

    return $form;
  }

  /**
   * @Route("/generate/{id}")
   * @Template()
   */
  public function generateAction(\Club\TournamentBundle\Entity\Tournament $tournament)
  {
    $em = $this->getDoctrine()->getManager();

    $bracket = $this->get('club_tournament.bracket')
      ->setUsers($em->getRepository('ClubTournamentBundle:Attend')->getSeeds($tournament))
      ->setSeeds($tournament->getSeeds())
      ->shuffleUsers()
      ->getBracket();

    return array(
      'bracket' => $bracket,
      'tournament' => $tournament
    );
  }

  /**
   * @Route("/build/{id}")
   * @Template()
   */
  public function buildAction(\Club\TournamentBundle\Entity\Tournament $tournament)
  {
    $em = $this->getDoctrine()->getManager();

    $bracket = $this->get('club_tournament.bracket')
      ->setUsers($em->getRepository('ClubTournamentBundle:Attend')->getSeeds($tournament))
      ->setSeeds($tournament->getSeeds())
      ->shuffleUsers()
      ->getBracket();

    $em = $this->getDoctrine()->getManager();

    $tournament->setRounds(count($bracket));
    $tournament->setBuild(true);
    $em->persist($tournament);

    foreach ($bracket as $round_id => $round) {
      $tr = new \Club\TournamentBundle\Entity\TournamentRound();
      $tr->setTournament($tournament);
      $tr->setRound($round_id);
      $tr->setRoundName($round['name']);

      $em->persist($tr);
      if (isset($round['matches'])) {
        foreach ($round['matches'] as $match_id => $match) {
          $tg = new \Club\TournamentBundle\Entity\TournamentGame();
          $tg->setTournament($tournament);
          $tg->setTournamentRound($tr);
          $tg->setGame($match_id);

          if (isset($match[0])) {
            if ($match[0]['user']) $tg->setTeamOne($match[0]['user']);
            if ($match[1]['user']) $tg->setTeamTwo($match[1]['user']);
          }

          $em->persist($tg);
        }
      }
    }

    $em->flush();

    $this->get('club_extra.flash')->addNotice();

    return $this->redirect($this->generateUrl('club_tournament_admintournament_index'));
  }
}

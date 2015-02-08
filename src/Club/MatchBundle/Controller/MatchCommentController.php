<?php

namespace Club\MatchBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\RedirectResponse;

/**
 * @Route("/match/match/comment")
 */
class MatchCommentController extends Controller
{
  /**
   * @Route("")
   * @Template()
   */
  public function indexAction()
  {
    $em = $this->getDoctrine()->getManager();
    $leagues = $em->getRepository('ClubMatchBundle:League')->getTopLists();

    return array(
      'leagues' => $leagues
    );
  }

  /**
   * @Route("/new/{match_id}")
   * @Template()
   */
  public function newAction($match_id)
  {
    $em = $this->getDoctrine()->getManager();
    $match = $em->find('ClubMatchBundle:Match', $match_id);

    $comment = new \Club\MatchBundle\Entity\MatchComment();
    $comment->setMatch($match);
    $comment->setUser($this->getUser());

    $form = $this->createForm(new \Club\MatchBundle\Form\MatchComment, $comment);

    if ($this->getRequest()->getMethod() == 'POST') {
      $form->bind($this->getRequest());
      if ($form->isValid()) {
        $em->persist($comment);
        $em->flush();

        $this->get('club_extra.flash')->addNotice();

        return $this->redirect($this->generateUrl('club_match_match_show', array(
          'id' => $match->getId()
        )));
      }
    }

    return array(
      'form' => $form->createView(),
      'match' => $match
    );
  }

  /**
   * @Route("/edit/{id}")
   * @Template()
   */
  public function editAction($id)
  {
    $league = $em->find('ClubMatchBundle:League',$id);

    $res = $this->process($league);

    if ($res instanceOf RedirectResponse)

      return $res;

    return array(
      'league' => $league,
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
      $league = $em->find('ClubMatchBundle:League',$this->getRequest()->get('id'));

      $em->remove($league);
      $em->flush();

      $this->get('club_extra.flash')->addNotice();
    } catch (\PDOException $e) {
      $this->get('session')->getFlashBag()->add('error', $this->get('translator')->trans('You cannot delete league which is already being used.'));
    }

    return $this->redirect($this->generateUrl('club_match_adminranking_index'));
  }

  protected function process($league)
  {
    $form = $this->createForm(new \Club\MatchBundle\Form\League(), $league);

    if ($this->getRequest()->getMethod() == 'POST') {
      $form->bind($this->getRequest());
      if ($form->isValid()) {
        $em = $this->getDoctrine()->getManager();
        $em->persist($league);
        $em->flush();

        $this->get('club_extra.flash')->addNotice();

        return $this->redirect($this->generateUrl('club_match_adminranking_index'));
      }
    }

    return $form;
  }
}

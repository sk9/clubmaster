<?php

namespace Club\UserBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class AuthController extends Controller
{
    /**
     * @Route("/login_check", name="login_check")
     */
    public function loginCheck()
    {
    }

    /**
     * @Route("/logout", name="logout")
     * @Template()
     */
    public function logoutAction()
    {
        return array();
    }

    /**
     * @Route("/login", name="login")
     * @Template()
     */
    public function loginAction()
    {
        $this->get('club_extra.flash')->addInfo($this->get('translator')
            ->trans('Enter your username and password.')
        );

        return array();
    }

    /**
     * @Route("/{_locale}/auth/forgot", name="auth_forgot")
     * @Template()
     */
    public function forgotAction()
    {
        $form = $this->createFormBuilder()
            ->add('username', 'text', array(
                'label' => 'Username or email'
            ))
            ->getForm();

        if ($this->getRequest()->getMethod() == 'POST') {
            $form->bind($this->getRequest());
            $post = $form->getData();

            $em = $this->getDoctrine()->getManager();
            $user = $em->getRepository('ClubUserBundle:User')->findOneBy(array(
                'member_number' => $post['username']
            ));

            if (!($user instanceOf \Club\UserBundle\Entity\User)) {
                $email = $em->getRepository('ClubUserBundle:ProfileEmail')->findOneBy(array(
                    'email_address' => $post['username']
                ));

                if ($email instanceOf \Club\UserBundle\Entity\ProfileEmail) {
                    $user = $email->getProfile()->getUser();
                }
            }

            if ($user instanceOf \Club\UserBundle\Entity\User) {
                $forgot = new \Club\UserBundle\Entity\ForgotPassword();
                $forgot->setUser($user);
                $em->persist($forgot);
                $em->flush();

                $event = new \Club\UserBundle\Event\FilterForgotPasswordEvent($forgot);
                $this->get('event_dispatcher')->dispatch(\Club\UserBundle\Event\Events::onPasswordReset, $event);
            }

            $this->get('session')->getFlashBag()->add('notice', $this->get('translator')->trans('You will receive an email within a few minutes.'));

            return $this->redirect($this->generateUrl('homepage'));
        }

        $this->get('club_extra.flash')->addInfo($this->get('translator')
            ->trans('Enter your username or email address, and you will receive a reset password email within a few minutes.')
        );
        return array(
            'form' => $form->createView()
        );
    }

    /**
     * @Route("/{_locale}/auth/reset/{hash}", name="auth_reset")
     * @Template()
     */
    public function resetPasswordAction($hash)
    {
        $em = $this->getDoctrine()->getManager();
        $forgot = $em->getRepository('ClubUserBundle:ForgotPassword')->findOneByHash($hash);

        if ($forgot instanceOf \Club\UserBundle\Entity\ForgotPassword) {
            if ($this->getRequest()->getMethod() == 'POST') {
                $user = $forgot->getUser();
            } else {
                $user = new \Club\UserBundle\Entity\User();
            }
            $form = $this->createForm(new \Club\UserBundle\Form\ForgotPassword(), $user);

            if ($this->getRequest()->getMethod() == 'POST') {
                $form->bind($this->getRequest());

                if ($form->isValid()) {
                    $forgot->setExpireDate(new \DateTime());

                    $em->persist($user);
                    $em->persist($forgot);
                    $em->flush();

                    $this->get('session')->set('notice','Your password has been set.');

                    return $this->redirect($this->generateUrl('homepage'));
                }
            }

            return array(
                'form' => $form->createView(),
                'forgot' => $forgot
            );
        }
    }

    /**
     * @Route("/{_locale}/auth/signin")
     * @Template()
     */
    public function signinAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();

        $user = $this->get('clubmaster.user')
            ->buildUser()
            ->get();

        $form = $this->createForm(new \Club\UserBundle\Form\User(), $user);
        $formGuest = $this->createForm(new \Club\UserBundle\Form\GuestType(), $user);

        $form->handleRequest($request);
        $formGuest->handleRequest($request);

        $userCreated = false;

        if ($form->isValid()) {
            $this->get('clubmaster.user')->save();
            $userCreated = true;
        }

        if ($formGuest->isValid()) {
            $this->get('clubmaster.user')->save(false);
            $userCreated = true;
        }

        if ($userCreated) {
            $this->get('session')->getFlashBag()->add('notice',$this->get('translator')->trans('Your account has been created.'));

            $token = new \Symfony\Component\Security\Core\Authentication\Token\UsernamePasswordToken(
                $user,
                null,
                'user'
            );
            $this->get('security.context')->setToken($token);
            $url = $this->get('session')->get('_security.user.target_path');
            $this->get('session')->set('_security.user.target_path', null);

            return $this->redirect($url);
        }

        return array(
            'form' => $form->createView(),
            'formGuest' => $formGuest->createView()
        );
    }
}

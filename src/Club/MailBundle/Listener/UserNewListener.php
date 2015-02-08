<?php

namespace Club\MailBundle\Listener;

class UserNewListener
{
    protected $container;
    protected $em;
    protected $templating;
    protected $router;
    protected $clubmaster_mailer;

    public function __construct($container)
    {
        $this->container = $container;
        $this->em = $container->get('doctrine.orm.default_entity_manager');
        $this->templating = $container->get('templating');
        $this->router = $container->get('router');
        $this->clubmaster_mailer = $container->get('clubmaster_mailer');
    }

    public function onUserNew(\Club\UserBundle\Event\FilterUserEvent $event)
    {
        switch (false) {
        case ($this->container->getParameter('club_mail.mail_on_welcome')):
        case ($event->getSendMail()):
            return false;
            break;
        }

        $user = $event->getUser();
        $email = $user->getProfile()->getProfileEmail();

        if ($email) {
            $this->clubmaster_mailer
                ->init()
                ->setSpool(false)
                ->setSubject('Welcome')
                ->setFrom()
                ->setTo($email->getEmailAddress())
                ->setBody($this->templating->render('ClubMailBundle:Template:user_new.html.twig',array(
                    'user' => $user,
                    'url' => $this->router->generate('homepage', array(), true)
                )))
                ;

            $attachments = $this->container->getParameter('club_user.welcome_mail_attachments');

            if (is_array($attachments)) {
                foreach ($attachments as $attach) {
                    $filename = sprintf('%s/Resources/%s',
                        $this->container->get('kernel')->getRootDir(),
                        $attach
                    );

                    $this->clubmaster_mailer
                        ->attachFile($filename)
                        ;
                }
            }

            $this->clubmaster_mailer->send();
        }
    }
}

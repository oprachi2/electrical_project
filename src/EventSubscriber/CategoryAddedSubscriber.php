<?php

namespace App\EventSubscriber;


use App\Entity\Category;
use App\Entity\User;
use EasyCorp\Bundle\EasyAdminBundle\Event\AfterEntityPersistedEvent;
use EasyCorp\Bundle\EasyAdminBundle\Event\BeforeEntityPersistedEvent;
use EasyCorp\Bundle\EasyAdminBundle\Event\BeforeEntityUpdatedEvent;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Symfony\Component\Security\Core\Security;

class CategoryAddedSubscriber implements EventSubscriberInterface
{
    private $mailer;
    
    public function __construct(Security $security,MailerInterface $mailer)
    {
        $this->security = $security;
        $this->mailer = $mailer;
    } 

    public function sendMail(AfterEntityPersistedEvent $event)
    {
        $entity = $event->getEntityInstance();
        if ($entity instanceof Category){
            $cat_name=$entity->getName();
            $cat_Managed_by=(string) $entity->getManagedBy();
            $email = (new Email())
            ->from('random162128@gmail.com')
            ->to($cat_Managed_by)
            ->subject('New  Electrical Category is Created')
            ->text(' You are Assigned to '.$cat_name.' category')
            ->html('<p>You are Assigned to <b>'.$cat_name.'<b> category</p>');
            $this->mailer->send($email);  
          }
        else if($entity instanceof User)
        {
            $userName=$entity->getEmail();
            $email = (new Email())
            ->from('random162128@gmail.com')
            ->to($userName)
            ->subject('Thank you for Registration')
            ->text('<p>As Per the Policies of our Website please <b>Change Your Passwoord</b> As Soon as Possible please click on the Reset Password Link and Enter Your Email id. To Reset Password click on <a href="http://localhost:8000/reset-password">Click here</a></p>')
            ->html('<p>As Per the Policies of our Website please <b>Change Your Passwoord</b> As Soon as Possible please click on the Reset Password Link and Enter Your Email id. To Reset Password click on <a href="http://localhost:8000/reset-password">Click here</a></p>');
            $this->mailer->send($email);
        }
    }

    public static function getSubscribedEvents()
    {
        return [
            AfterEntityPersistedEvent::class=>['sendMail'],
            BeforeEntityPersistedEvent::class => ['setCategory'],
            BeforeEntityUpdatedEvent::class => ['updateCategory'],
        
        ];
    }
    public function setCategory(BeforeEntityPersistedEvent $event){
        $entity = $event->getEntityInstance();
        if ($entity instanceof Category) {
           
            $entity->setCreated(new \DateTime());
            $entity->setUpdated(new \DateTime());
            
        }
        
        return;
    }

    public function updateCategory(BeforeEntityUpdatedEvent $event){
        $entity = $event->getEntityInstance();
        if ($entity instanceof Category) {
           
            $entity->setUpdated(new \DateTime());
        }
        
        return;
    }
    
}
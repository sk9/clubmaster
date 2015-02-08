<?php

namespace Club\UserBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="Club\UserBundle\Entity\ForgotPasswordRepository")
 * @ORM\Table(name="club_user_forgot_password")
 * @ORM\HasLifecycleCallbacks()
 */
class ForgotPassword
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     *
     * @var integer $id
     */
    protected $id;

    /**
     * @ORM\Column(type="string")
     *
     * @var string $hash
     */
    protected $hash;

    /**
     * @ORM\Column(type="datetime")
     *
     * @var string $expire_date
     */
    protected $expire_date;

    /**
     * @ORM\ManyToOne(targetEntity="User")
     * @Orm\JoinColumn(onDelete="cascade")
     *
     * @var Club\UserBundle\Entity\User
     */
    protected $user;

    /**
     * Get id
     *
     * @return integer $id
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set hash
     *
     * @param string $hash
     */
    public function setHash($hash)
    {
        $this->hash = $hash;
    }

    /**
     * Get hash
     *
     * @return string $hash
     */
    public function getHash()
    {
        return $this->hash;
    }

    /**
     * Set expire_date
     *
     * @param datetime $expireDate
     */
    public function setExpireDate($expireDate)
    {
        $this->expire_date = $expireDate;
    }

    /**
     * Get expire_date
     *
     * @return datetime $expireDate
     */
    public function getExpireDate()
    {
        return $this->expire_date;
    }

    /**
     * Set user
     *
     * @param Club\UserBundle\Entity\User $user
     */
    public function setUser(\Club\UserBundle\Entity\User $user)
    {
        $this->user = $user;
    }

    /**
     * Get user
     *
     * @return Club\UserBundle\Entity\User $user
     */
    public function getUser()
    {
        return $this->user;
    }

    /**
     * @ORM\PrePersist
     */
    public function prePersist()
    {
      $this->setHash(base_convert(sha1(uniqid(mt_rand(), true)), 16, 36));
      $this->setExpireDate(new \DateTime(date('Y-m-d H:i:s',strtotime('+1 day'))));
    }
}

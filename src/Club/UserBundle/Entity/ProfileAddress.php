<?php

namespace Club\UserBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ORM\Entity(repositoryClass="Club\UserBundle\Entity\ProfileAddressRepository")
 * @ORM\Table(name="club_user_profile_address")
 * @ORM\HasLifecycleCallbacks()
 */
class ProfileAddress
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
     * @ORM\Column(type="text")
     * @Assert\NotBlank()
     * @Assert\NotBlank(groups={"user", "guest"})
     *
     * @var string $street
     */
    protected $street;

    /**
     * @ORM\Column(type="string")
     * @Assert\NotBlank()
     * @Assert\NotBlank(groups={"user", "guest"})
     *
     * @var string $postal_code
     */
    protected $postal_code;

    /**
     * @ORM\Column(type="string")
     * @Assert\NotBlank()
     * @Assert\NotBlank(groups={"user", "guest"})
     *
     * @var string $city
     */
    protected $city;

    /**
     * @ORM\Column(type="string", nullable=true)
     *
     * @var string $state
     */
    protected $state;

    /**
     * @ORM\Column(type="string")
     * @Assert\NotBlank()
     * @Assert\NotBlank(groups={"user", "guest"})
     * @var string $country
     */
    protected $country;

    /**
     * @ORM\Column(type="string")
     * @Assert\NotBlank()
     * @Assert\NotBlank(groups={"user", "guest"})
     *
     * @var string $contact_type
     */
    protected $contact_type;

    /**
     * @ORM\ManyToOne(targetEntity="Profile", inversedBy="profile_addresses")
     * @ORM\JoinColumn(name="profile_id", referencedColumnName="id", onDelete="cascade")
     *
     * @var Club\UserBundle\Entity\Profile
     */
    protected $profile;

    public function __construct()
    {
      $this->setContactType('home');
    }

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
     * Set street
     *
     * @param string $street
     */
    public function setStreet($street)
    {
        $this->street = $street;
    }

    /**
     * Get street
     *
     * @return string $street
     */
    public function getStreet()
    {
        return $this->street;
    }

    /**
     * Set postal_code
     *
     * @param string $postalCode
     */
    public function setPostalCode($postalCode)
    {
        $this->postal_code = $postalCode;
    }

    /**
     * Get postal_code
     *
     * @return string $postalCode
     */
    public function getPostalCode()
    {
        return $this->postal_code;
    }

    /**
     * Set city
     *
     * @param string $city
     */
    public function setCity($city)
    {
        $this->city = $city;
    }

    /**
     * Get city
     *
     * @return string $city
     */
    public function getCity()
    {
        return $this->city;
    }

    /**
     * Set state
     *
     * @param string $state
     */
    public function setState($state)
    {
        $this->state = $state;
    }

    /**
     * Get state
     *
     * @return string $state
     */
    public function getState()
    {
        return $this->state;
    }

    /**
     * Set country
     *
     * @param string $country
     */
    public function setCountry($country)
    {
        $this->country = $country;
    }

    /**
     * Get country
     *
     * @return string $country
     */
    public function getCountry()
    {
        return $this->country;
    }

    /**
     * Set contact_type
     *
     * @param string $contactType
     */
    public function setContactType($contactType)
    {
        $this->contact_type = $contactType;
    }

    /**
     * Get contact_type
     *
     * @return string $contactType
     */
    public function getContactType()
    {
        return $this->contact_type;
    }

    /**
     * Set profile
     *
     * @param Club\UserBundle\Entity\Profile $profile
     */
    public function setProfile(\Club\UserBundle\Entity\Profile $profile)
    {
        $this->profile = $profile;
    }

    /**
     * Get profile
     *
     * @return Club\UserBundle\Entity\Profile $profile
     */
    public function getProfile()
    {
        return $this->profile;
    }
}

<?php

namespace Club\ShopBundle\Repository;

use Doctrine\ORM\EntityRepository;

/**
 * OrderStatus
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class OrderStatus extends EntityRepository
{
  public function getDefaultStatus()
  {
    return $this->_em->createQueryBuilder()
      ->select('s')
      ->from('ClubShopBundle:OrderStatus','s')
      ->orderBy('s.priority')
      ->setMaxResults(1)
      ->getQuery()
      ->getSingleResult();
  }

  public function getAcceptedStatus()
  {
    return $this->_em->createQueryBuilder()
      ->select('s')
      ->from('ClubShopBundle:OrderStatus','s')
      ->where('s.accepted = 1')
      ->getQuery()
      ->getSingleResult();
  }
}

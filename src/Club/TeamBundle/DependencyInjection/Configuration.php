<?php

namespace Club\TeamBundle\DependencyInjection;

use Symfony\Component\Config\Definition\Builder\TreeBuilder;
use Symfony\Component\Config\Definition\ConfigurationInterface;

/**
 * This is the class that validates and merges configuration from your app/config files
 *
 * To learn more see {@link http://symfony.com/doc/current/cookbook/bundles/extension.html#cookbook-bundles-extension-config-class}
 */
class Configuration implements ConfigurationInterface
{
    /**
     * {@inheritDoc}
     */
    public function getConfigTreeBuilder()
    {
        $treeBuilder = new TreeBuilder();
        $rootNode = $treeBuilder->root('club_team');

        // Here you should define the parameters that are allowed to
        // configure your bundle. See the documentation linked above for
        // more information on that topic.

        $rootNode
          ->children()
            ->scalarNode('enabled')->isRequired()->end()
            ->scalarNode('future_occurs')->isRequired()->end()
            ->scalarNode('minutes_before_schedule')->isRequired()->end()
            ->scalarNode('minutes_after_schedule')->isRequired()->end()
            ->scalarNode('penalty_enabled')->isRequired()->end()
            ->scalarNode('cancel_minute_before')->isRequired()->end()
            ->scalarNode('cancel_minute_created')->isRequired()->end()
            ->scalarNode('num_team_day')->isRequired()->end()
            ->scalarNode('num_team_future')->isRequired()->end()
            ->scalarNode('penalty_product_name')->isRequired()->end()
            ->scalarNode('public_user_activity')->isRequired()->end()
            ->scalarNode('public_teamlist')->defaultValue(true)->end()
          ->end();

        return $treeBuilder;
    }
}

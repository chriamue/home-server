# nextcloud

For more information and versions visit:
[https://hub.docker.com/r/wonderfall/nextcloud/]()

## Configure

Change your config.php file:

```vim
'memcache.distributed' => '\OC\Memcache\Redis',
'memcache.locking' => '\OC\Memcache\Redis',
'memcache.local' => '\OC\Memcache\APCu',
'redis' => array(
   'host' => 'nextcloud-redis',
   'port' => 6379,
   ),
```

## Usage

Open nextcloud in browser: [http://nextcloud.localhost]()
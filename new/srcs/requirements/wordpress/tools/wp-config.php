<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'yel' );

/** Database password */
define( 'DB_PASSWORD', '12345' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'LD=V/Y_eAHEtN:4X Jx+sB<}%PHKWi9B9fO<BaD0@SO&[9C}{5X`MII(q:s`VzbS' );
define( 'SECURE_AUTH_KEY',  '24n0Y;|w!xWN^NvCQ`/<#34V,pB/g4y/,j0%j:R5[@P=i90ruY<XuMx >%1iJB8/' );
define( 'LOGGED_IN_KEY',    '$5=dP#}U(7--~`yEPu8 P$h>U|pvRScbwV_A^1H.D1><3_:p!H7<;=UK[ x7TRvB' );
define( 'NONCE_KEY',        'C|ofi_P1LEx38<5U b]TFJ#r_bJLCJ`B5B1: mUiZE^bu1Bi{p~.1&h`<d[Exts[' );
define( 'AUTH_SALT',        'w}jdEq7(BxCM~fcsi7k{1c2J`O K12x<~fK6Dz^G>?[/?@B=ORgdDMFQ(g/gw,5_' );
define( 'SECURE_AUTH_SALT', '1<S<&7H^llWHc9],{u7sP&~+6jZ6+1LQn&/@nD0TKgF P*Ng&nsq=IxHm>A|@<j{' );
define( 'LOGGED_IN_SALT',   '48}dQOt]lIPjG06b94)$akVm~aqLf0K*)a^~t^j}bNi2_hoZ+Yj[|/6AC]bw}zWc' );
define( 'NONCE_SALT',       'y3P#B+=eHN}Og@O1tQ4 y`YwWZ(*I*tuxgP4[##6v)^Mo]vW}ix;%XuN}=9<a+g!' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
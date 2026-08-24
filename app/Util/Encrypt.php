<?php

namespace App\Util;

class Encrypt 
{
    private static string $key  = "WGgyNEt0cGRvNDVDQnQy@";  
    private static string $pass = "SGFDQDIwMjNyZFMu=="; // Frase codificada en base64
    private static string $iv   = "\x15\x28\x32\x63\x20\x15\x23\x85\x74\x14\x02\x65\x03\x00\x06\x05";
    const METHOD                = 'aes-256-cbc';

    public static function base64url_encode(string $data): string {
        return rtrim(strtr(base64_encode($data), '+/', '-_'), '=');
    }

    public static function base64url_decode(string $data): string {
        return base64_decode(str_pad(strtr($data, '-_', '+/'), strlen($data) % 4, '=', STR_PAD_RIGHT));
    }

    public static function encrypted(string $txt_plant): string {
        $key = substr(hash('sha256', self::$pass, true), 0, 32);

        return self::base64url_encode(
            openssl_encrypt(
                $txt_plant,
                self::METHOD,
                $key,
                OPENSSL_RAW_DATA,
                self::$iv
            )
        );
    }

    public static function decrypted(string $txt_plant): string {
        if (is_null($txt_plant)) {
            throw new \Exception('El texto se encuentra vacío');
        }

        $key = substr(hash('sha256', self::$pass, true), 0, 32);

        return openssl_decrypt(
            self::base64url_decode($txt_plant),
            self::METHOD,
            $key,
            OPENSSL_RAW_DATA,
            self::$iv
        );
    }
}
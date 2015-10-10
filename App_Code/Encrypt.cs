using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Security.Cryptography;
public class Encrypt
{
    SHA512CryptoServiceProvider SHA512 = new SHA512CryptoServiceProvider();
    SHA1CryptoServiceProvider SHA1 = new SHA1CryptoServiceProvider();

    public string KeyHash(string key)
    {
        byte[] bkey = Encoding.UTF8.GetBytes(key);
        bkey = SHA512.ComputeHash(bkey);
        string hash = BitConverter.ToString(bkey).Replace("-", string.Empty);

        bkey = Encoding.UTF8.GetBytes(hash);
        bkey = SHA1.ComputeHash(bkey);
        hash = BitConverter.ToString(bkey).Replace("-", string.Empty);

        return hash;
    }

    public string PasswordHash(string key)
    {
        byte[] bkey = Encoding.UTF8.GetBytes(key);
        bkey = SHA512.ComputeHash(bkey);
        string hash = BitConverter.ToString(bkey).Replace("-", string.Empty);

        bkey = Encoding.UTF8.GetBytes(hash);
        bkey = SHA1.ComputeHash(bkey);
        hash = BitConverter.ToString(bkey).Replace("-", string.Empty);

        return hash;
    }
}
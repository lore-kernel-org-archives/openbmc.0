Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wpqfJ0kWpzDq8M
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 16:07:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cVIALjz0"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id w143so1797802yww.1
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 23:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=XzPnKJU/qUMal2a+UZhd4ESN8qdO6Hb/e5mvL9fFToo=;
 b=cVIALjz0e8zwRQr8ZWVfmMn8+kvVn0N641xtdPYIt7/TGezAr1eYAZn1q9t9PSdfKA
 A0qmW7rA1hP86TLJEYl52w7r8wv1UTLT3q4pr2796oDIF/FPCZ89MVgHpY/EnTwJs/ph
 8Zgp+hhbvW7lkqXf5p5pDkFzBA2sBrMC9cX7uvuhJMEMbfPYH3wAaDsxcz+q1xznmG2I
 5cicK4SAKqZROkd3buyXPXlVbN/Gso73MWGPuXPJCvWQ0dfAD1oPolqXBUxMXNf7Gd6K
 XhKS9DVURAVKxx9XTyieWArySLP1fn3gRHoWAtT4zpf6usS3sTic0kV+2mvVXBBaPSOS
 byag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=XzPnKJU/qUMal2a+UZhd4ESN8qdO6Hb/e5mvL9fFToo=;
 b=tITDcMJKQuEjPvD3DHHcD5gtWNUN55RGLUJTA5jyVCW0scLO8nx/Swsst3tpR9H+fb
 nIHbEpQYC4sHXYQ6Pl9ygNy2OZJXgJpR6ZzyQJ3cf9OXEEpgk4MBdPT1oa+tl5EtFFrQ
 l+pSEReq9sL/JZfGXlifEMBOU9fIDKCFGq1psdHYOVPrd66BzGwQsuZ8aEmRhOtgU3+m
 F1O8qO47t8e3WMmweQTpZA/Fvy9fp6zJRvW2Sx9ekZklD8/qj4ZaDkxDUCRaZnVWXR8O
 pgQqmtG/N9lxR5tRJaO9Rzpc0b8/gXL6tCPr8J+24XclNhiL1Bc+5uJ3Owk2I8twkx2R
 ngrg==
X-Gm-Message-State: AKS2vOybieHvzBa44hNZHv4mE7XQv3SfZa/Yl272RS/Wlt19uYJyvH1k
 FMS6RRMnpiy1HA3iOW7u3vLnrzm+EQ==
X-Received: by 10.13.212.69 with SMTP id w66mr7092183ywd.164.1497593253598;
 Thu, 15 Jun 2017 23:07:33 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Thu, 15 Jun 2017 23:07:13 -0700 (PDT)
In-Reply-To: <7CEA6E4B-F655-4FC4-8A40-FD599AB98A36@fuzziesquirrel.com>
References: <20170609041457.31708-1-andrew@aj.id.au>
 <20170609041457.31708-4-andrew@aj.id.au>
 <CACPK8XfoH0vRf5WK41KYj1HQbDPUwovM3ieChCgv_EMVdWZP2g@mail.gmail.com>
 <7CEA6E4B-F655-4FC4-8A40-FD599AB98A36@fuzziesquirrel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Jun 2017 15:37:13 +0930
X-Google-Sender-Auth: xLuIyRhu2T4hJqcUCc_2e0Qr-aI
Message-ID: <CACPK8XeQO85H2ZbTUaXv4RMsc2MLtpSPUma8q0bXva_tAn3VZg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hwmon: max31785: Provide config of fault pin
 behavior
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Jeremy Kerr <jk@ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>, 
 msbarth <msbarth@linux.vnet.ibm.com>, Andrew Jeffery <andrew@aj.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Jun 2017 06:07:36 -0000

On Fri, Jun 9, 2017 at 10:08 PM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
>> On Jun 9, 2017, at 1:27 AM, Joel Stanley <joel@jms.id.au> wrote:
>>
>> On Fri, Jun 9, 2017 at 1:44 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>>> From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>>>
>>> Provide interface to set behavior when FAULT pin is asserted.
>>> When enabled force fan to 100% PWM duty cycle.
>>>
>>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>>> [Andrew Jeffery: Make it apply to reworked driver]
>>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>>> ---
>>> drivers/hwmon/max31785.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++++
>>> 1 file changed, 84 insertions(+)
>>>
>>> diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
>>> index ecece346be28..b4a350477ee5 100644
>>> --- a/drivers/hwmon/max31785.c
>>> +++ b/drivers/hwmon/max31785.c
>>> @@ -38,6 +38,7 @@
>>> #define MAX31785_REG_MFR_ID                    0x99
>>> #define MAX31785_REG_MFR_MODEL                 0x9a
>>> #define MAX31785_REG_MFR_REVISION              0x9b
>>> +#define MAX31785_REG_MFR_FAULT_RESP            0xd9
>>> #define MAX31785_REG_MFR_FAN_CONFIG            0xf1
>>> #define MAX31785_REG_READ_FAN_PWM              0xf3
>>>
>>> @@ -51,6 +52,9 @@
>>> /* Fan Status register bits */
>>> #define MAX31785_FAN_STATUS_FAULT_MASK         0x80
>>>
>>> +/* Fault response register bits */
>>> +#define MAX31785_FAULT_RESP_PIN_MONITOR                0x01
>>> +
>>> /* Fan Command constants */
>>> #define MAX31785_FAN_COMMAND_PWM_RATIO         40
>>>
>>> @@ -755,6 +759,82 @@ static const struct hwmon_chip_info max31785_chip_info_0x3040 = {
>>>        .info = max31785_info_0x3040,
>>> };
>>>
>>> +static ssize_t max31785_fault_resp_store(struct device *dev,
>>> +                               struct device_attribute *attr, const char *buf,
>>> +                               size_t count)
>>> +{
>>> +       struct i2c_client *client = to_i2c_client(dev);
>>> +       struct max31785 *data = dev_get_drvdata(dev);
>>> +       int rv;
>>> +
>>> +       mutex_lock(&data->lock);
>>> +
>>> +       rv = max31785_set_page(client, 0);
>>> +       if (rv < 0)
>>> +               goto done;
>>> +
>>> +       rv = i2c_smbus_read_byte_data(client, MAX31785_REG_MFR_FAULT_RESP);
>>> +       if (rv < 0)
>>> +               goto done;
>>> +
>>> +       if (!strncmp(buf, "on", strlen("on"))) {
>>
>> This is interesting. What do you gain from the strlen?
>>
>>> +               if (!(rv & MAX31785_FAULT_RESP_PIN_MONITOR)) {
>>> +                       rv |= MAX31785_FAULT_RESP_PIN_MONITOR;
>>
>> Is this something we're toggling on and off at runtime?
>>
>> I doubt it is. This should be enabled at probe time.
>
> I had asked jk if this should be DT or sysfs.  jk: can you comment?

As with the watchdog, this is a property of the wiring of the system -
a hardware property - so I think it should be device tree.

I applied the other two patches in the series, but not this one.

Cheers,

Joel

>
>> If we want to
>> make it an option then use a device tree property, but I don't think
>> it even needs to be optional.
>>
>> Chris, can you confirm that this does not need to be dynamic?
>
> It does not need to be dynamic.
>
>>
>> Cheers,
>>
>> Joel
>>
>>
>>> +                       rv = i2c_smbus_write_byte_data(client,
>>> +                                       MAX31785_REG_MFR_FAULT_RESP, rv);
>>> +                       if (rv < 0)
>>> +                               goto done;
>>> +               }
>>> +       } else if (!strncmp(buf, "off", strlen("off"))) {
>>> +               if (rv & MAX31785_FAULT_RESP_PIN_MONITOR) {
>>> +                       rv &= ~MAX31785_FAULT_RESP_PIN_MONITOR;
>>> +                       rv = i2c_smbus_write_byte_data(client,
>>> +                                       MAX31785_REG_MFR_FAULT_RESP, rv);
>>> +                       if (rv < 0)
>>> +                               goto done;
>>> +               }
>>> +       } else {
>>> +               dev_warn(dev, "Unknown fault response type: [%s]\n", buf);
>>> +               rv = -EINVAL;
>>> +       }
>>> +
>>> +done:
>>> +       mutex_unlock(&data->lock);
>>> +
>>> +       return rv;
>>> +}
>>> +
>>> +static ssize_t max31785_fault_resp_show(struct device *dev,
>>> +                              struct device_attribute *attr, char *buf)
>>> +{
>>> +       struct max31785 *data = max31785_update_device(dev);
>>> +       struct i2c_client *client = to_i2c_client(dev);
>>> +       int rv;
>>> +
>>> +       mutex_lock(&data->lock);
>>> +
>>> +       rv = max31785_set_page(client, 0);
>>> +       if (rv < 0)
>>> +               goto done;
>>> +
>>> +       rv = i2c_smbus_read_byte_data(client, MAX31785_REG_MFR_FAULT_RESP);
>>> +       if (rv < 0)
>>> +               goto done;
>>> +
>>> +       if (rv & MAX31785_FAULT_RESP_PIN_MONITOR)
>>> +               rv = sprintf(buf, "on\n");
>>> +       else
>>> +               rv = sprintf(buf, "off\n");
>>> +
>>> +done:
>>> +       mutex_unlock(&data->lock);
>>> +
>>> +       return rv;
>>> +}
>>> +
>>> +static DEVICE_ATTR(fault_resp, 0644, max31785_fault_resp_show,
>>> +               max31785_fault_resp_store);
>>> +
>>>
>>> static int max31785_get_capabilities(struct max31785 *data)
>>> {
>>> @@ -804,6 +884,10 @@ static int max31785_probe(struct i2c_client *client,
>>>        else
>>>                chip = &max31785_chip_info_0x3030;
>>>
>>> +       rc = device_create_file(dev, &dev_attr_fault_resp);
>>> +       if (rc)
>>> +               return rc;
>>> +
>>>        hwmon_dev = devm_hwmon_device_register_with_info(dev,
>>>                        client->name, data, chip, NULL);
>>>
>>> --
>>> 2.11.0
>>>

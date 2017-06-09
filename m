Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wkhfv2S1GzDqLD
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 22:38:46 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH v2 3/3] hwmon: max31785: Provide config of fault pin
 behavior
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CACPK8XfoH0vRf5WK41KYj1HQbDPUwovM3ieChCgv_EMVdWZP2g@mail.gmail.com>
Date: Fri, 9 Jun 2017 08:38:42 -0400
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 msbarth <msbarth@linux.vnet.ibm.com>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7CEA6E4B-F655-4FC4-8A40-FD599AB98A36@fuzziesquirrel.com>
References: <20170609041457.31708-1-andrew@aj.id.au>
 <20170609041457.31708-4-andrew@aj.id.au>
 <CACPK8XfoH0vRf5WK41KYj1HQbDPUwovM3ieChCgv_EMVdWZP2g@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>,
 Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Fri, 09 Jun 2017 12:38:47 -0000


> On Jun 9, 2017, at 1:27 AM, Joel Stanley <joel@jms.id.au> wrote:
>=20
> On Fri, Jun 9, 2017 at 1:44 PM, Andrew Jeffery <andrew@aj.id.au> =
wrote:
>> From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>>=20
>> Provide interface to set behavior when FAULT pin is asserted.
>> When enabled force fan to 100% PWM duty cycle.
>>=20
>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>> [Andrew Jeffery: Make it apply to reworked driver]
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> ---
>> drivers/hwmon/max31785.c | 84 =
++++++++++++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 84 insertions(+)
>>=20
>> diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
>> index ecece346be28..b4a350477ee5 100644
>> --- a/drivers/hwmon/max31785.c
>> +++ b/drivers/hwmon/max31785.c
>> @@ -38,6 +38,7 @@
>> #define MAX31785_REG_MFR_ID                    0x99
>> #define MAX31785_REG_MFR_MODEL                 0x9a
>> #define MAX31785_REG_MFR_REVISION              0x9b
>> +#define MAX31785_REG_MFR_FAULT_RESP            0xd9
>> #define MAX31785_REG_MFR_FAN_CONFIG            0xf1
>> #define MAX31785_REG_READ_FAN_PWM              0xf3
>>=20
>> @@ -51,6 +52,9 @@
>> /* Fan Status register bits */
>> #define MAX31785_FAN_STATUS_FAULT_MASK         0x80
>>=20
>> +/* Fault response register bits */
>> +#define MAX31785_FAULT_RESP_PIN_MONITOR                0x01
>> +
>> /* Fan Command constants */
>> #define MAX31785_FAN_COMMAND_PWM_RATIO         40
>>=20
>> @@ -755,6 +759,82 @@ static const struct hwmon_chip_info =
max31785_chip_info_0x3040 =3D {
>>        .info =3D max31785_info_0x3040,
>> };
>>=20
>> +static ssize_t max31785_fault_resp_store(struct device *dev,
>> +                               struct device_attribute *attr, const =
char *buf,
>> +                               size_t count)
>> +{
>> +       struct i2c_client *client =3D to_i2c_client(dev);
>> +       struct max31785 *data =3D dev_get_drvdata(dev);
>> +       int rv;
>> +
>> +       mutex_lock(&data->lock);
>> +
>> +       rv =3D max31785_set_page(client, 0);
>> +       if (rv < 0)
>> +               goto done;
>> +
>> +       rv =3D i2c_smbus_read_byte_data(client, =
MAX31785_REG_MFR_FAULT_RESP);
>> +       if (rv < 0)
>> +               goto done;
>> +
>> +       if (!strncmp(buf, "on", strlen("on"))) {
>=20
> This is interesting. What do you gain from the strlen?
>=20
>> +               if (!(rv & MAX31785_FAULT_RESP_PIN_MONITOR)) {
>> +                       rv |=3D MAX31785_FAULT_RESP_PIN_MONITOR;
>=20
> Is this something we're toggling on and off at runtime?
>=20
> I doubt it is. This should be enabled at probe time.

I had asked jk if this should be DT or sysfs.  jk: can you comment?

> If we want to
> make it an option then use a device tree property, but I don't think
> it even needs to be optional.
>=20
> Chris, can you confirm that this does not need to be dynamic?

It does not need to be dynamic.

>=20
> Cheers,
>=20
> Joel
>=20
>=20
>> +                       rv =3D i2c_smbus_write_byte_data(client,
>> +                                       MAX31785_REG_MFR_FAULT_RESP, =
rv);
>> +                       if (rv < 0)
>> +                               goto done;
>> +               }
>> +       } else if (!strncmp(buf, "off", strlen("off"))) {
>> +               if (rv & MAX31785_FAULT_RESP_PIN_MONITOR) {
>> +                       rv &=3D ~MAX31785_FAULT_RESP_PIN_MONITOR;
>> +                       rv =3D i2c_smbus_write_byte_data(client,
>> +                                       MAX31785_REG_MFR_FAULT_RESP, =
rv);
>> +                       if (rv < 0)
>> +                               goto done;
>> +               }
>> +       } else {
>> +               dev_warn(dev, "Unknown fault response type: [%s]\n", =
buf);
>> +               rv =3D -EINVAL;
>> +       }
>> +
>> +done:
>> +       mutex_unlock(&data->lock);
>> +
>> +       return rv;
>> +}
>> +
>> +static ssize_t max31785_fault_resp_show(struct device *dev,
>> +                              struct device_attribute *attr, char =
*buf)
>> +{
>> +       struct max31785 *data =3D max31785_update_device(dev);
>> +       struct i2c_client *client =3D to_i2c_client(dev);
>> +       int rv;
>> +
>> +       mutex_lock(&data->lock);
>> +
>> +       rv =3D max31785_set_page(client, 0);
>> +       if (rv < 0)
>> +               goto done;
>> +
>> +       rv =3D i2c_smbus_read_byte_data(client, =
MAX31785_REG_MFR_FAULT_RESP);
>> +       if (rv < 0)
>> +               goto done;
>> +
>> +       if (rv & MAX31785_FAULT_RESP_PIN_MONITOR)
>> +               rv =3D sprintf(buf, "on\n");
>> +       else
>> +               rv =3D sprintf(buf, "off\n");
>> +
>> +done:
>> +       mutex_unlock(&data->lock);
>> +
>> +       return rv;
>> +}
>> +
>> +static DEVICE_ATTR(fault_resp, 0644, max31785_fault_resp_show,
>> +               max31785_fault_resp_store);
>> +
>>=20
>> static int max31785_get_capabilities(struct max31785 *data)
>> {
>> @@ -804,6 +884,10 @@ static int max31785_probe(struct i2c_client =
*client,
>>        else
>>                chip =3D &max31785_chip_info_0x3030;
>>=20
>> +       rc =3D device_create_file(dev, &dev_attr_fault_resp);
>> +       if (rc)
>> +               return rc;
>> +
>>        hwmon_dev =3D devm_hwmon_device_register_with_info(dev,
>>                        client->name, data, chip, NULL);
>>=20
>> --
>> 2.11.0
>>=20

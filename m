Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7FDB81A03DF
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2016 09:47:13 +1100 (AEDT)
Received: from localhost (32.97.110.54 [32.97.110.54]) by mx.zohomail.com
 with SMTPS id 145687242579716.43725223676745;
 Tue, 1 Mar 2016 14:47:05 -0800 (PST)
Date: Tue, 1 Mar 2016 16:47:03 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Adriana Kobylak <anoo@us.ibm.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH openbmc] Add temporary adm1278 hwmon pmbus driver patch
Message-ID: <20160301224703.GE6601@asimov.pw-on-the.net>
References: <1455705024-15045-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455705024-15045-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8XcOB-RzarE67ddZZHj2CuiRAupL07Fe1dPUHHC=W4CweQ@mail.gmail.com>
 <201603012115.u21LFFHj020687@d01av03.pok.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lteA1dqeVaWQ9QQl"
Content-Disposition: inline
In-Reply-To: <201603012115.u21LFFHj020687@d01av03.pok.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_2_25026_11
X-ZohoMail-Owner: <20160301224703.GE6601@asimov.pw-on-the.net>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 32.97.110.54
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Mar 2016 22:47:15 -0000


--lteA1dqeVaWQ9QQl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2016 at 03:15:12PM -0600, Adriana Kobylak wrote:
> What makes this pull request different from other openbmc changes to=20
> require to be sent via git-send-email before it can be reviewed?

I suspect Joel is just asking for it to also be submitted to the Linux
tree so that its content can be reviewed there.  I agree we should not
merge patches into the openbmc tree unless it fixes a critical problem
and has also been submitted to the upstream tree.

>=20
>=20
>=20
>=20
>=20
>=20
> From:   Joel Stanley <joel@jms.id.au>
> To:     OpenBMC Patches <openbmc-patches@stwcx.xyz>
> Cc:     OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Date:   02/17/2016 10:24 PM
> Subject:        Re: [PATCH openbmc] Add temporary adm1278 hwmon pmbus=20
> driver patch
> Sent by:        "openbmc"=20
> <openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org>
>=20
>=20
>=20
> On Wed, Feb 17, 2016 at 9:00 PM, OpenBMC Patches
> <openbmc-patches@stwcx.xyz> wrote:
> > From: Yi Li <adamliyi@msn.com>
> >
> > This patch temporarily adds adm1278 hwmon driver as a kernel patch to=
=20
> openbmc,
> > for testing on Barreleye.
>=20
> Can you please send this as a patch with git-send-email so we can review=
=20
> it.
>=20
> > If in the future this patch will still be useful, it should be put into=
=20
> linux kernel.
> >
> > Barreleye has three adm1278 devices on three i2c buses.
> > This patch enables reading adm1278 sensors via hwmon sysfs interface.
> > The enabled sensors are: current, voltage (In and Out), power and=20
> temperature.
> > Detail usage can be found in 'readme_adm1278.txt'.
> >
> > Signed-off-by: Yi Li <adamliyi@msn.com>
> > ---
> >  .../recipes-kernel/linux/linux-obmc/barreleye.cfg  |   3 +
> >  .../linux/linux-obmc/hwmon_adm1278.patch           | 165=20
> +++++++++++++++++++++
> >  .../linux/linux-obmc/readme_adm1278.txt            |  78 ++++++++++
> >  .../recipes-kernel/linux/linux-obmc_%.bbappend     |   3 +
> >  4 files changed, 249 insertions(+)
> >  create mode 100644=20
> meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipe=
s-kernel/linux/linux-obmc/barreleye.cfg
> >  create mode 100644=20
> meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipe=
s-kernel/linux/linux-obmc/hwmon_adm1278.patch
> >  create mode 100644=20
> meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipe=
s-kernel/linux/linux-obmc/readme_adm1278.txt
> >  create mode 100644=20
> meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipe=
s-kernel/linux/linux-obmc_%.bbappend
> >
> > diff --git=20
> a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/reci=
pes-kernel/linux/linux-obmc/barreleye.cfg=20
> b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/reci=
pes-kernel/linux/linux-obmc/barreleye.cfg
> > new file mode 100644
> > index 0000000..086f191
> > --- /dev/null
> > +++=20
> b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/reci=
pes-kernel/linux/linux-obmc/barreleye.cfg
> > @@ -0,0 +1,3 @@
> > +CONFIG_PMBUS=3Dy
> > +CONFIG_SENSORS_PMBUS=3Dy
> > +CONFIG_SENSORS_ADM1275=3Dy
> > diff --git=20
> a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/reci=
pes-kernel/linux/linux-obmc/hwmon_adm1278.patch=20
> b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/reci=
pes-kernel/linux/linux-obmc/hwmon_adm1278.patch
> > new file mode 100644
> > index 0000000..074d39f
> > --- /dev/null
> > +++=20
> b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/reci=
pes-kernel/linux/linux-obmc/hwmon_adm1278.patch
> > @@ -0,0 +1,165 @@
> > +diff --git a/drivers/hwmon/pmbus/adm1275.c=20
> b/drivers/hwmon/pmbus/adm1275.c
> > +index 188af4c..a45075d 100644
> > +--- a/drivers/hwmon/pmbus/adm1275.c
> > ++++ b/drivers/hwmon/pmbus/adm1275.c
> > +@@ -24,7 +24,7 @@
> > + #include <linux/bitops.h>
> > + #include "pmbus.h"
> > +
> > +-enum chips { adm1075, adm1275, adm1276, adm1293, adm1294 };
> > ++enum chips { adm1075, adm1275, adm1276, adm1278, adm1293, adm1294 };
> > +
> > + #define ADM1275_MFR_STATUS_IOUT_WARN2 BIT(0)
> > + #define ADM1293_MFR_STATUS_VAUX_UV_WARN       BIT(5)
> > +@@ -70,6 +70,22 @@ enum chips { adm1075, adm1275, adm1276, adm1293,=20
> adm1294 };
> > + #define ADM1075_VAUX_OV_WARN          BIT(7)
> > + #define ADM1075_VAUX_UV_WARN          BIT(6)
> > +
> > ++#define ADM1278_PMON_CONTROL          0xd3
> > ++#define ADM1278_PMON_CONFIG           0xd4
> > ++#define ADM1278_CFG_TSFLT             BIT(15)
> > ++#define ADM1278_CFG_SIMULTANEOUS      BIT(14)
> > ++#define ADM1278_CFG_PMON_MODE         BIT(4)
> > ++#define ADM1278_CFG_TEMP1_EN          BIT(3)
> > ++#define ADM1278_CFG_VIN_EN            BIT(2)
> > ++#define ADM1278_CFG_VOUT_EN           BIT(1)
> > ++#define ADM1278_PEAK_TEMPERATURE      0xd7
> > ++
> > ++#define ADM1278_R_SENSE       1000    /* R_sense resistor value in=20
> microohmsi */
> > ++
> > ++static int r_sense =3D ADM1278_R_SENSE;
> > ++module_param(r_sense, int, 0644);
> > ++MODULE_PARM_DESC(r_sense, "Rsense resistor value in microohms");
> > ++
> > + struct adm1275_data {
> > +       int id;
> > +       bool have_oc_fault;
> > +@@ -186,6 +202,11 @@ static int adm1275_read_word_data(struct=20
> i2c_client *client, int page, int reg)
> > +       case PMBUS_VIRT_READ_VIN_MAX:
> > +               ret =3D pmbus_read_word_data(client, 0, ADM1275_PEAK_VI=
N);
> > +               break;
> > ++      case PMBUS_VIRT_READ_TEMP_MAX:
> > ++              if (data->id !=3D adm1278)
> > ++                      return -ENODATA;
> > ++              ret =3D pmbus_read_word_data(client, 0,=20
> ADM1278_PEAK_TEMPERATURE);
> > ++              break;
> > +       case PMBUS_VIRT_READ_PIN_MIN:
> > +               if (!data->have_pin_min)
> > +                       return -ENXIO;
> > +@@ -199,6 +220,7 @@ static int adm1275_read_word_data(struct i2c_clien=
t=20
> *client, int page, int reg)
> > +       case PMBUS_VIRT_RESET_IOUT_HISTORY:
> > +       case PMBUS_VIRT_RESET_VOUT_HISTORY:
> > +       case PMBUS_VIRT_RESET_VIN_HISTORY:
> > ++      case PMBUS_VIRT_RESET_TEMP_HISTORY:
> > +               break;
> > +       case PMBUS_VIRT_RESET_PIN_HISTORY:
> > +               if (!data->have_pin_max)
> > +@@ -239,6 +261,9 @@ static int adm1275_write_word_data(struct=20
> i2c_client *client, int page, int reg,
> > +       case PMBUS_VIRT_RESET_VIN_HISTORY:
> > +               ret =3D pmbus_write_word_data(client, 0, ADM1275_PEAK_V=
IN,=20
> 0);
> > +               break;
> > ++      case PMBUS_VIRT_RESET_TEMP_HISTORY:
> > ++              ret =3D pmbus_write_word_data(client, 0,=20
> ADM1278_PEAK_TEMPERATURE, 0);
> > ++              break;
> > +       case PMBUS_VIRT_RESET_PIN_HISTORY:
> > +               ret =3D pmbus_write_word_data(client, 0, ADM1276_PEAK_P=
IN,=20
> 0);
> > +               if (!ret && data->have_pin_min)
> > +@@ -312,6 +337,7 @@ static const struct i2c_device_id adm1275_id[] =3D=
 {
> > +       { "adm1075", adm1075 },
> > +       { "adm1275", adm1275 },
> > +       { "adm1276", adm1276 },
> > ++      { "adm1278", adm1278 },
> > +       { "adm1293", adm1293 },
> > +       { "adm1294", adm1294 },
> > +       { }
> > +@@ -335,6 +361,8 @@ static int adm1275_probe(struct i2c_client *client,
> > +                                    | I2C_FUNC_SMBUS_BLOCK_DATA))
> > +               return -ENODEV;
> > +
> > ++      /* i2c_aspeed driver does not handle i2c_smbus_read_block_data=
=20
> correctly */
> > ++#if 0
> > +       ret =3D i2c_smbus_read_block_data(client, PMBUS_MFR_ID,=20
> block_buffer);
> > +       if (ret < 0) {
> > +               dev_err(&client->dev, "Failed to read Manufacturer=20
> ID\n");
> > +@@ -363,6 +391,7 @@ static int adm1275_probe(struct i2c_client *client,
> > +               dev_notice(&client->dev,
> > +                          "Device mismatch: Configured %s, detected=20
> %s\n",
> > +                          id->name, mid->name);
> > ++#endif
> > +
> > +       config =3D i2c_smbus_read_byte_data(client, ADM1275_PMON_CONFIG=
);
> > +       if (config < 0)
> > +@@ -377,7 +406,9 @@ static int adm1275_probe(struct i2c_client *client,
> > +       if (!data)
> > +               return -ENOMEM;
> > +
> > +-      data->id =3D mid->driver_data;
> > ++      /* i2c_aspeed driver does not handle i2c_smbus_read_block_data=
=20
> correctly */
> > ++      //data->id =3D mid->driver_data;
> > ++      data->id =3D adm1278;
> > +
> > +       info =3D &data->info;
> > +
> > +@@ -460,6 +491,62 @@ static int adm1275_probe(struct i2c_client=20
> *client,
> > +                       info->func[0] |=3D
> > +                         PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
> > +               break;
> > ++      case adm1278:
> > ++              /* Configure monitoring */
> > ++              ret =3D i2c_smbus_write_byte_data(client,
> > ++                      ADM1278_PMON_CONTROL, 0);
> > ++              if (ret < 0)
> > ++                      return ret;
> > ++              ret =3D i2c_smbus_read_word_data(client,=20
> ADM1275_PMON_CONFIG);
> > ++              ret =3D i2c_smbus_write_word_data(client,=20
> ADM1275_PMON_CONFIG,
> > ++                                              ADM1278_CFG_PMON_MODE |
> > ++                                              ADM1278_CFG_TEMP1_EN |
> > ++                                              ADM1278_CFG_VIN_EN |
> > ++                                              ADM1278_CFG_VOUT_EN);
> > ++              if (ret < 0)
> > ++                      return ret;
> > ++              ret =3D i2c_smbus_read_word_data(client,=20
> ADM1275_PMON_CONFIG);
> > ++              dev_info(&client->dev, "adm1278 config: 0x%x\n", ret);
> > ++              ret =3D i2c_smbus_write_byte_data(client,=20
> ADM1278_PMON_CONTROL,1);
> > ++              if (ret < 0)
> > ++                      return ret;
> > ++
> > ++              info->func[0] |=3D PMBUS_HAVE_VIN
> > ++                      | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> > ++                      | PMBUS_HAVE_PIN
> > ++                      | PMBUS_HAVE_STATUS_INPUT
> > ++                      | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
> > ++
> > ++              data->have_oc_fault =3D false;
> > ++              data->have_uc_fault =3D false;
> > ++              data->have_vout =3D true;
> > ++              data->have_vaux_status =3D false;
> > ++              data->have_mfr_vaux_status =3D false;
> > ++              data->have_iout_min =3D false;
> > ++              data->have_pin_min =3D false;
> > ++              data->have_pin_max =3D true;
> > ++
> > ++              info->m[PSC_VOLTAGE_IN] =3D 19599;
> > ++              info->b[PSC_VOLTAGE_IN] =3D 0;
> > ++              info->R[PSC_VOLTAGE_IN] =3D -2;
> > ++
> > ++              info->m[PSC_VOLTAGE_OUT] =3D 19599;
> > ++              info->b[PSC_VOLTAGE_OUT] =3D 0;
> > ++              info->R[PSC_VOLTAGE_OUT] =3D -2;
> > ++
> > ++              info->m[PSC_CURRENT_OUT] =3D 800 * r_sense / 1000;
> > ++              info->b[PSC_CURRENT_OUT] =3D 20475;
> > ++              info->R[PSC_CURRENT_OUT] =3D -1;
> > ++
> > ++              info->m[PSC_POWER] =3D 6123 * r_sense / 1000;
> > ++              info->b[PSC_POWER] =3D 0;
> > ++              info->R[PSC_POWER] =3D -2;
> > ++
> > ++              info->format[PSC_TEMPERATURE] =3D direct;
> > ++              info->m[PSC_TEMPERATURE] =3D 42;
> > ++              info->b[PSC_TEMPERATURE] =3D 31880;
> > ++              info->R[PSC_TEMPERATURE] =3D -1;
> > ++              break;
> > +       case adm1293:
> > +       case adm1294:
> > +               data->have_iout_min =3D true;
> > diff --git=20
> a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/reci=
pes-kernel/linux/linux-obmc/readme_adm1278.txt=20
> b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/reci=
pes-kernel/linux/linux-obmc/readme_adm1278.txt
> > new file mode 100644
> > index 0000000..e86d977
> > --- /dev/null
> > +++=20
> b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/reci=
pes-kernel/linux/linux-obmc/readme_adm1278.txt
> > @@ -0,0 +1,78 @@
> > +README for adm1278 hwmon driver
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Yi Li <shliyi@cn.ibm.com>
> > +
> > +
> > +This is a temporary kernel patch to enable hwmon driver for adm1278=20
> chip on Barreleye.
> > +When this patch is merged into linux kernel, this patch will be remove=
d=20
> from openbmc.
> > +
> > +The adm1278 driver is created according to datasheet:
> >=20
> +http://www.analog.com/media/en/technical-documentation/data-sheets/ADM12=
78.pdf
> > +
> > +The patch heavily re-used adm1278 enabling code from:=20
> https://github.com/facebook/openbmc/blob/master/meta-aspeed/recipes-kerne=
l/linux/files/patch-2.6.28.9/0000-linux-openbmc.patch
> .
> > +
> > +This patch has been tested on barreleye, by following these steps:
> > +
> > +1) There are 3 adm1278 devices on Barreleye
> > +
> > +I2C5: P12v_a for CPU0
> > +I2C6: P12v_b for CPU1
> > +I2C7: P12v_c for HDD and IO Board
> > +
> > +2) adm1278 driver is based on adm1275.c, which depends on pmbus. This=
=20
> patch builds
> > +adm1275 and pmbus into kernel.
> > +
> > +3) When kernel booted, initialize the adm1278 devices:
> > +
> > +root@barreleye:~# echo adm1278 0x10 >=20
> /sys/class/i2c-adapter/i2c-4/new_device
> > +root@barreleye:~# echo adm1278 0x10 >=20
> /sys/class/i2c-adapter/i2c-5/new_device
> > +root@barreleye:~# echo adm1278 0x10 >=20
> /sys/class/i2c-adapter/i2c-6/new_device
> > +
> > +There will be three new hwmon sysfs entries created:
> > +
> > +root@barreleye:~# ls /sys/class/hwmon/hwmon3/
> > +curr1_highest         in1_highest           in1_reset_history=20
> in2_min_alarm         power1_label          temp1_input
> > +curr1_input           in1_input             in2_highest=20
> in2_reset_history     power1_max            temp1_max
> > +curr1_label           in1_label             in2_input             name=
 =20
>                power1_reset_history  temp1_max_alarm
> > +curr1_max             in1_max               in2_label power/ =20
> subsystem/            temp1_reset_history
> > +curr1_max_alarm       in1_max_alarm         in2_max power1_alarm =20
> temp1_crit            uevent
> > +curr1_reset_history   in1_min               in2_max_alarm power1_input=
 =20
>        temp1_crit_alarm
> > +device/               in1_min_alarm         in2_min=20
> power1_input_highest  temp1_highest
> > +root@barreleye:~# ls /sys/class/hwmon/hwmon4/
> > +curr1_highest         in1_highest           in1_reset_history=20
> in2_min_alarm         power1_label          temp1_input
> > +curr1_input           in1_input             in2_highest=20
> in2_reset_history     power1_max            temp1_max
> > +curr1_label           in1_label             in2_input             name=
 =20
>                power1_reset_history  temp1_max_alarm
> > +curr1_max             in1_max               in2_label power/ =20
> subsystem/            temp1_reset_history
> > +curr1_max_alarm       in1_max_alarm         in2_max power1_alarm =20
> temp1_crit            uevent
> > +curr1_reset_history   in1_min               in2_max_alarm power1_input=
 =20
>        temp1_crit_alarm
> > +device/               in1_min_alarm         in2_min=20
> power1_input_highest  temp1_highest
> > +root@barreleye:~# ls /sys/class/hwmon/hwmon5/
> > +curr1_highest         in1_highest           in1_reset_history=20
> in2_min_alarm         power1_label          temp1_input
> > +curr1_input           in1_input             in2_highest=20
> in2_reset_history     power1_max            temp1_max
> > +curr1_label           in1_label             in2_input             name=
 =20
>                power1_reset_history  temp1_max_alarm
> > +curr1_max             in1_max               in2_label power/ =20
> subsystem/            temp1_reset_history
> > +curr1_max_alarm       in1_max_alarm         in2_max power1_alarm =20
> temp1_crit            uevent
> > +curr1_reset_history   in1_min               in2_max_alarm power1_input=
 =20
>        temp1_crit_alarm
> > +device/               in1_min_alarm         in2_min=20
> power1_input_highest  temp1_highest
> > +
> > +4) For details of what each hwmon sysfs attributes mean, please refer=
=20
> to:
> > +https://www.kernel.org/doc/Documentation/hwmon/pmbus
> > +For short, 'curr1_*' refers to 'IOUT', 'in1_*' refers to 'vin', 'in2_*=
'=20
> refers to 'vout', 'power1_*' refers to 'input power',
> > +'temp1_*' for 'temperature'.
> > +
> > +5) Remaining issue:
> > +
> > +5.1) Currently, i2c_aspeed driver does not handle=20
> "i2c_smbus_read_block_data()" correctly. So this patch has to bypass some=
=20
> detection code.
> > +We need to fix this issue when the patch is merged to kernel.
> > +5.2) According to adm1278 datasheet, there is a sense resistor used to=
=20
> measure power and current. The resistor will affect conversion between
> > +adm1278 register value to real-world value for current and power. I am=
=20
> not very sure about the resistor value. So using 1 mili-ohms (or 1000=20
> micro-ohms) as default value. When build the adm1275 driver as kernel=20
> module, we can set this resistor value by:
> > +
> > +# insmod adm1275.ko r_sense=3D500
> > +
> > +This will set the 'sense resistor' to 500 micro-ohms.
> > +5.3) Some of the sensor value, e.g, 'temp1_input' seems not reasonable=
,=20
> e.g:
> > +
> > +root@barreleye:~# cat /sys/class/hwmon/hwmon4/temp1_input
> > +-270952
> > +
> > +Need further check on that.
> > diff --git=20
> a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/reci=
pes-kernel/linux/linux-obmc_%.bbappend=20
> b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/reci=
pes-kernel/linux/linux-obmc_%.bbappend
> > new file mode 100644
> > index 0000000..b6e8e16
> > --- /dev/null
> > +++=20
> b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/reci=
pes-kernel/linux/linux-obmc_%.bbappend
> > @@ -0,0 +1,3 @@
> > +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/linux-obmc:"
> > +SRC_URI +=3D "file://barreleye.cfg"
> > +SRC_URI +=3D "file://hwmon_adm1278.patch"
> > --
> > 2.7.1
> >
> >
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>=20
>=20
>=20
>=20

> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc


--=20
Patrick Williams

--lteA1dqeVaWQ9QQl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJW1hvnAAoJEKsDR8wtAMEZT8wP/Au0bLVa3WcDjSLznW+Etgx/
Kjmybf1H7q3k5r2BOhYQss0WNH7cQYy7H/mZVYexlIYrk9NwpnNWIIkqSaCLnPMk
ym1KgneC8GkEo1Dj7AKfuXEnH/waJ3hqeS9JS5OySuYQ4avresApXpxP1XS55tio
/lWWfZ1DBVZsghrTUKdy1IOLUZE8HQ3wad+b/7yQyx9LZ2wIOZUo6QHi+SkHI+Df
H3mfmHx93uW+CAMmlk3asXcWO0SW6mZ4l4nhCq7HNv/fU0kHke8xjDm9M3fc/M13
WMn2aS6tukchKFOTXCpT/+WD4a167VtVoAWpFpLkVYx7vtHmWDqzJL9cw64bEoDt
YGqeAjudP5e8zvqx4Z12a/sBLJRTB6+yEIWo+o208iQkNtXp6Z7EkRPlu6lfpkTm
ZNVACzteqrR815VFN04eXA9qvHWJ2uHDnDhIb7Tez4Tw/dDGqhtgrYIWPERyrQrR
/PYmzpZ3oUupr6nZOgiJ7FLYe66KY87zxPNRnQCAukV4jV4TXQllg13DfxDZ1oIk
BuBOxHvTeg5HpANmMaYyu8ZUrPQhIZwviNXSejgYbyPu1b0+W6/3lwisP5kzRkHb
jqp7efp7ANPcDljk1kwQA6Qqa4KOJPVpXnMiNiqhEIjUw7JPhyHfn1Q7SBwf+FHM
VpM99wCTddf9M3taIoKH
=BTua
-----END PGP SIGNATURE-----

--lteA1dqeVaWQ9QQl--

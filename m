Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qc6LS1hvQzDq5y
 for <openbmc@lists.ozlabs.org>; Sat,  2 Apr 2016 03:30:24 +1100 (AEDT)
Received: from localhost (32.97.110.54 [32.97.110.54]) by mx.zohomail.com
 with SMTPS id 1459528215719421.6544756746972;
 Fri, 1 Apr 2016 09:30:15 -0700 (PDT)
Date: Fri, 1 Apr 2016 11:30:13 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Chris Austen <austenc@us.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc v3] meta-phosphor: Move to openbmc-20160329-1
Message-ID: <20160401163013.GK11491@asimov.austin.ibm.com>
References: <1459242085-10506-2-git-send-email-openbmc-patches@stwcx.xyz>
 <1459242085-10506-1-git-send-email-openbmc-patches@stwcx.xyz>
 <201603291540.u2TFeZYA011264@d01av03.pok.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ijf6z65S790CMqo8"
Content-Disposition: inline
In-Reply-To: <201603291540.u2TFeZYA011264@d01av03.pok.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Z_61896388 SPT_1 Z_56716064 SPT_1 SLF_D
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
X-List-Received-Date: Fri, 01 Apr 2016 16:30:25 -0000


--ijf6z65S790CMqo8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2016 at 03:39:19PM +0000, Chris Austen wrote:
> Joel, have you tested this on real hardware?
>=20

He says so on github.

https://github.com/openbmc/openbmc/pull/212
"Otherwise, this should be good to go. Tested on a Barreleye."

>=20
> Chris Austen
> POWER Systems Enablement Manager=20
> (512) 286-5184 (T/L: 363-5184)
>=20
> -----"openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org> wr=
ote: -----
> To: openbmc@lists.ozlabs.org
> From: OpenBMC Patches=20
> Sent by: "openbmc"=20
> Date: 03/29/2016 04:02AM
> Subject: [PATCH openbmc v3] meta-phosphor: Move to openbmc-20160329-1
>=20
> From: Joel Stanley <joel@jms.id.au>
>=20
> We are now on a 4.4 based kernel
>=20
>  - Fix i2c_smbus_read_block_data error in our i2c bus driver
>  - Includes many JFFS2 fixes identified by Milton:
>     * Fix directory hardlinks from deleted directories
>     * Revert "jffs2: Fix lock acquisition order bug in jffs2_write_begin"
>     * jffs2: Fix page lock / f->sem deadlock
>     * jffs2: reduce the breakage on recovery from halfway failed rename()
>     * mtd: spi-nor: aspeed-smc: Fix flash struct setup for scan
>  - Remove our in-tree adm1275 driver in favour of the upstream one,
>    which was cherry picked from 4.6-rc1. Adds support for device tree
>  - Incremental cleanups to the p8 occ hwmon driver
>  - SCU fixes for GPIO configuration relating to Ethernet phy and PCIe
>=20
>  Squishes down most of the fixes that were found in the 4.3 development
>  effort into the commit that added the driver. This is part of the work
>  in preparing for upstreaming Aspeed kernel support.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../recipes-kernel/linux/linux-obmc/barreleye.cfg  |   3 -
>  .../linux/linux-obmc/hwmon_adm1278.patch           | 165 ---------------=
------
>  .../linux/linux-obmc/readme_adm1278.txt            |  78 ----------
>  .../recipes-kernel/linux/linux-obmc_%.bbappend     |   3 -
>  .../common/recipes-kernel/linux/linux-obmc_4.3.bb  |  30 ----
>  .../common/recipes-kernel/linux/linux-obmc_4.4.bb  |  20 +++
>  6 files changed, 20 insertions(+), 279 deletions(-)
>  delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/m=
eta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
>  delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/m=
eta-barreleye/recipes-kernel/linux/linux-obmc/hwmon_adm1278.patch
>  delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/m=
eta-barreleye/recipes-kernel/linux/linux-obmc/readme_adm1278.txt
>  delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/m=
eta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend
>  delete mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc_=
4.3.bb
>  create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc_=
4.4.bb
>=20
> diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-bar=
releye/recipes-kernel/linux/linux-obmc/barreleye.cfg b/meta-openbmc-machine=
s/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-o=
bmc/barreleye.cfg
> deleted file mode 100644
> index 086f191..0000000
> --- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/=
recipes-kernel/linux/linux-obmc/barreleye.cfg
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -CONFIG_PMBUS=3Dy
> -CONFIG_SENSORS_PMBUS=3Dy
> -CONFIG_SENSORS_ADM1275=3Dy
> diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-bar=
releye/recipes-kernel/linux/linux-obmc/hwmon_adm1278.patch b/meta-openbmc-m=
achines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/l=
inux-obmc/hwmon_adm1278.patch
> deleted file mode 100644
> index 074d39f..0000000
> --- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/=
recipes-kernel/linux/linux-obmc/hwmon_adm1278.patch
> +++ /dev/null
> @@ -1,165 +0,0 @@
> -diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275=
=2Ec
> -index 188af4c..a45075d 100644
> ---- a/drivers/hwmon/pmbus/adm1275.c
> -+++ b/drivers/hwmon/pmbus/adm1275.c
> -@@ -24,7 +24,7 @@
> - #include <linux/bitops.h>
> - #include "pmbus.h"
> -=20
> --enum chips { adm1075, adm1275, adm1276, adm1293, adm1294 };
> -+enum chips { adm1075, adm1275, adm1276, adm1278, adm1293, adm1294 };
> -=20
> - #define ADM1275_MFR_STATUS_IOUT_WARN2	BIT(0)
> - #define ADM1293_MFR_STATUS_VAUX_UV_WARN	BIT(5)
> -@@ -70,6 +70,22 @@ enum chips { adm1075, adm1275, adm1276, adm1293, adm1=
294 };
> - #define ADM1075_VAUX_OV_WARN		BIT(7)
> - #define ADM1075_VAUX_UV_WARN		BIT(6)
> -=20
> -+#define ADM1278_PMON_CONTROL		0xd3
> -+#define ADM1278_PMON_CONFIG		0xd4
> -+#define ADM1278_CFG_TSFLT		BIT(15)
> -+#define ADM1278_CFG_SIMULTANEOUS	BIT(14)
> -+#define ADM1278_CFG_PMON_MODE		BIT(4)
> -+#define ADM1278_CFG_TEMP1_EN		BIT(3)
> -+#define ADM1278_CFG_VIN_EN		BIT(2)
> -+#define ADM1278_CFG_VOUT_EN		BIT(1)
> -+#define ADM1278_PEAK_TEMPERATURE	0xd7
> -+
> -+#define ADM1278_R_SENSE	1000	/* R_sense resistor value in microohmsi */
> -+
> -+static int r_sense =3D ADM1278_R_SENSE;
> -+module_param(r_sense, int, 0644);
> -+MODULE_PARM_DESC(r_sense, "Rsense resistor value in microohms");
> -+
> - struct adm1275_data {
> - 	int id;
> - 	bool have_oc_fault;
> -@@ -186,6 +202,11 @@ static int adm1275_read_word_data(struct i2c_client=
 *client, int page, int reg)
> - 	case PMBUS_VIRT_READ_VIN_MAX:
> - 		ret =3D pmbus_read_word_data(client, 0, ADM1275_PEAK_VIN);
> - 		break;
> -+	case PMBUS_VIRT_READ_TEMP_MAX:
> -+		if (data->id !=3D adm1278)
> -+			return -ENODATA;
> -+		ret =3D pmbus_read_word_data(client, 0, ADM1278_PEAK_TEMPERATURE);
> -+		break;
> - 	case PMBUS_VIRT_READ_PIN_MIN:
> - 		if (!data->have_pin_min)
> - 			return -ENXIO;
> -@@ -199,6 +220,7 @@ static int adm1275_read_word_data(struct i2c_client =
*client, int page, int reg)
> - 	case PMBUS_VIRT_RESET_IOUT_HISTORY:
> - 	case PMBUS_VIRT_RESET_VOUT_HISTORY:
> - 	case PMBUS_VIRT_RESET_VIN_HISTORY:
> -+	case PMBUS_VIRT_RESET_TEMP_HISTORY:
> - 		break;
> - 	case PMBUS_VIRT_RESET_PIN_HISTORY:
> - 		if (!data->have_pin_max)
> -@@ -239,6 +261,9 @@ static int adm1275_write_word_data(struct i2c_client=
 *client, int page, int reg,
> - 	case PMBUS_VIRT_RESET_VIN_HISTORY:
> - 		ret =3D pmbus_write_word_data(client, 0, ADM1275_PEAK_VIN, 0);
> - 		break;
> -+	case PMBUS_VIRT_RESET_TEMP_HISTORY:
> -+		ret =3D pmbus_write_word_data(client, 0, ADM1278_PEAK_TEMPERATURE, 0);
> -+		break;
> - 	case PMBUS_VIRT_RESET_PIN_HISTORY:
> - 		ret =3D pmbus_write_word_data(client, 0, ADM1276_PEAK_PIN, 0);
> - 		if (!ret && data->have_pin_min)
> -@@ -312,6 +337,7 @@ static const struct i2c_device_id adm1275_id[] =3D {
> - 	{ "adm1075", adm1075 },
> - 	{ "adm1275", adm1275 },
> - 	{ "adm1276", adm1276 },
> -+	{ "adm1278", adm1278 },
> - 	{ "adm1293", adm1293 },
> - 	{ "adm1294", adm1294 },
> - 	{ }
> -@@ -335,6 +361,8 @@ static int adm1275_probe(struct i2c_client *client,
> - 				     | I2C_FUNC_SMBUS_BLOCK_DATA))
> - 		return -ENODEV;
> -=20
> -+	/* i2c_aspeed driver does not handle i2c_smbus_read_block_data correct=
ly */
> -+#if 0
> - 	ret =3D i2c_smbus_read_block_data(client, PMBUS_MFR_ID, block_buffer);
> - 	if (ret < 0) {
> - 		dev_err(&client->dev, "Failed to read Manufacturer ID\n");
> -@@ -363,6 +391,7 @@ static int adm1275_probe(struct i2c_client *client,
> - 		dev_notice(&client->dev,
> - 			   "Device mismatch: Configured %s, detected %s\n",
> - 			   id->name, mid->name);
> -+#endif
> -=20
> - 	config =3D i2c_smbus_read_byte_data(client, ADM1275_PMON_CONFIG);
> - 	if (config < 0)
> -@@ -377,7 +406,9 @@ static int adm1275_probe(struct i2c_client *client,
> - 	if (!data)
> - 		return -ENOMEM;
> -=20
> --	data->id =3D mid->driver_data;
> -+	/* i2c_aspeed driver does not handle i2c_smbus_read_block_data correct=
ly */
> -+	//data->id =3D mid->driver_data;
> -+	data->id =3D adm1278;
> -=20
> - 	info =3D &data->info;
> -=20
> -@@ -460,6 +491,62 @@ static int adm1275_probe(struct i2c_client *client,
> - 			info->func[0] |=3D
> - 			  PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
> - 		break;
> -+	case adm1278:
> -+		/* Configure monitoring */
> -+		ret =3D i2c_smbus_write_byte_data(client,
> -+			ADM1278_PMON_CONTROL, 0);
> -+		if (ret < 0)
> -+			return ret;
> -+		ret =3D i2c_smbus_read_word_data(client, ADM1275_PMON_CONFIG);
> -+		ret =3D i2c_smbus_write_word_data(client, ADM1275_PMON_CONFIG,
> -+						ADM1278_CFG_PMON_MODE |
> -+						ADM1278_CFG_TEMP1_EN |
> -+						ADM1278_CFG_VIN_EN |
> -+						ADM1278_CFG_VOUT_EN);
> -+		if (ret < 0)
> -+			return ret;
> -+		ret =3D i2c_smbus_read_word_data(client, ADM1275_PMON_CONFIG);
> -+		dev_info(&client->dev, "adm1278 config: 0x%x\n", ret);
> -+		ret =3D i2c_smbus_write_byte_data(client, ADM1278_PMON_CONTROL,1);
> -+		if (ret < 0)
> -+			return ret;
> -+
> -+		info->func[0] |=3D PMBUS_HAVE_VIN
> -+			| PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> -+			| PMBUS_HAVE_PIN
> -+			| PMBUS_HAVE_STATUS_INPUT
> -+			| PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
> -+
> -+		data->have_oc_fault =3D false;
> -+		data->have_uc_fault =3D false;
> -+		data->have_vout =3D true;
> -+		data->have_vaux_status =3D false;
> -+		data->have_mfr_vaux_status =3D false;
> -+		data->have_iout_min =3D false;
> -+		data->have_pin_min =3D false;
> -+		data->have_pin_max =3D true;
> -+
> -+		info->m[PSC_VOLTAGE_IN] =3D 19599;
> -+		info->b[PSC_VOLTAGE_IN] =3D 0;
> -+		info->R[PSC_VOLTAGE_IN] =3D -2;
> -+
> -+		info->m[PSC_VOLTAGE_OUT] =3D 19599;
> -+		info->b[PSC_VOLTAGE_OUT] =3D 0;
> -+		info->R[PSC_VOLTAGE_OUT] =3D -2;
> -+
> -+		info->m[PSC_CURRENT_OUT] =3D 800 * r_sense / 1000;
> -+		info->b[PSC_CURRENT_OUT] =3D 20475;
> -+		info->R[PSC_CURRENT_OUT] =3D -1;
> -+
> -+		info->m[PSC_POWER] =3D 6123 * r_sense / 1000;
> -+		info->b[PSC_POWER] =3D 0;
> -+		info->R[PSC_POWER] =3D -2;
> -+
> -+		info->format[PSC_TEMPERATURE] =3D direct;
> -+		info->m[PSC_TEMPERATURE] =3D 42;
> -+		info->b[PSC_TEMPERATURE] =3D 31880;
> -+		info->R[PSC_TEMPERATURE] =3D -1;
> -+		break;
> - 	case adm1293:
> - 	case adm1294:
> - 		data->have_iout_min =3D true;
> diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-bar=
releye/recipes-kernel/linux/linux-obmc/readme_adm1278.txt b/meta-openbmc-ma=
chines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/li=
nux-obmc/readme_adm1278.txt
> deleted file mode 100644
> index e86d977..0000000
> --- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/=
recipes-kernel/linux/linux-obmc/readme_adm1278.txt
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -README for adm1278 hwmon driver
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -Yi Li <shliyi@cn.ibm.com>
> -
> -
> -This is a temporary kernel patch to enable hwmon driver for adm1278 chip=
 on Barreleye.
> -When this patch is merged into linux kernel, this patch will be removed =
=66rom openbmc.
> -
> -The adm1278 driver is created according to datasheet:
> -http://www.analog.com/media/en/technical-documentation/data-sheets/ADM12=
78.pdf
> -
> -The patch heavily re-used adm1278 enabling code from: https://github.com=
/facebook/openbmc/blob/master/meta-aspeed/recipes-kernel/linux/files/patch-=
2.6.28.9/0000-linux-openbmc.patch.
> -
> -This patch has been tested on barreleye, by following these steps:
> -
> -1) There are 3 adm1278 devices on Barreleye
> -
> -I2C5: P12v_a for CPU0
> -I2C6: P12v_b for CPU1
> -I2C7: P12v_c for HDD and IO Board
> -
> -2) adm1278 driver is based on adm1275.c, which depends on pmbus. This pa=
tch builds
> -adm1275 and pmbus into kernel.
> -
> -3) When kernel booted, initialize the adm1278 devices:
> -
> -root@barreleye:~# echo adm1278 0x10 > /sys/class/i2c-adapter/i2c-4/new_d=
evice
> -root@barreleye:~# echo adm1278 0x10 > /sys/class/i2c-adapter/i2c-5/new_d=
evice
> -root@barreleye:~# echo adm1278 0x10 > /sys/class/i2c-adapter/i2c-6/new_d=
evice
> -
> -There will be three new hwmon sysfs entries created:
> -
> -root@barreleye:~# ls /sys/class/hwmon/hwmon3/
> -curr1_highest         in1_highest           in1_reset_history     in2_mi=
n_alarm         power1_label          temp1_input
> -curr1_input           in1_input             in2_highest           in2_re=
set_history     power1_max            temp1_max
> -curr1_label           in1_label             in2_input             name  =
                power1_reset_history  temp1_max_alarm
> -curr1_max             in1_max               in2_label             power/=
                subsystem/            temp1_reset_history
> -curr1_max_alarm       in1_max_alarm         in2_max               power1=
_alarm          temp1_crit            uevent
> -curr1_reset_history   in1_min               in2_max_alarm         power1=
_input          temp1_crit_alarm
> -device/               in1_min_alarm         in2_min               power1=
_input_highest  temp1_highest
> -root@barreleye:~# ls /sys/class/hwmon/hwmon4/
> -curr1_highest         in1_highest           in1_reset_history     in2_mi=
n_alarm         power1_label          temp1_input
> -curr1_input           in1_input             in2_highest           in2_re=
set_history     power1_max            temp1_max
> -curr1_label           in1_label             in2_input             name  =
                power1_reset_history  temp1_max_alarm
> -curr1_max             in1_max               in2_label             power/=
                subsystem/            temp1_reset_history
> -curr1_max_alarm       in1_max_alarm         in2_max               power1=
_alarm          temp1_crit            uevent
> -curr1_reset_history   in1_min               in2_max_alarm         power1=
_input          temp1_crit_alarm
> -device/               in1_min_alarm         in2_min               power1=
_input_highest  temp1_highest
> -root@barreleye:~# ls /sys/class/hwmon/hwmon5/
> -curr1_highest         in1_highest           in1_reset_history     in2_mi=
n_alarm         power1_label          temp1_input
> -curr1_input           in1_input             in2_highest           in2_re=
set_history     power1_max            temp1_max
> -curr1_label           in1_label             in2_input             name  =
                power1_reset_history  temp1_max_alarm
> -curr1_max             in1_max               in2_label             power/=
                subsystem/            temp1_reset_history
> -curr1_max_alarm       in1_max_alarm         in2_max               power1=
_alarm          temp1_crit            uevent
> -curr1_reset_history   in1_min               in2_max_alarm         power1=
_input          temp1_crit_alarm
> -device/               in1_min_alarm         in2_min               power1=
_input_highest  temp1_highest
> -
> -4) For details of what each hwmon sysfs attributes mean, please refer to:
> -https://www.kernel.org/doc/Documentation/hwmon/pmbus
> -For short, 'curr1_*' refers to 'IOUT', 'in1_*' refers to 'vin', 'in2_*' =
refers to 'vout', 'power1_*' refers to 'input power',
> -'temp1_*' for 'temperature'.
> -
> -5) Remaining issue:
> -
> -5.1) Currently, i2c_aspeed driver does not handle "i2c_smbus_read_block_=
data()" correctly. So this patch has to bypass some detection code.
> -We need to fix this issue when the patch is merged to kernel.
> -5.2) According to adm1278 datasheet, there is a sense resistor used to m=
easure power and current. The resistor will affect conversion between
> -adm1278 register value to real-world value for current and power. I am n=
ot very sure about the resistor value. So using 1 mili-ohms (or 1000 micro-=
ohms) as default value. When build the adm1275 driver as kernel module, we =
can set this resistor value by:
> -
> -# insmod adm1275.ko r_sense=3D500
> -
> -This will set the 'sense resistor' to 500 micro-ohms.
> -5.3) Some of the sensor value, e.g, 'temp1_input' seems not reasonable, =
e.g:
> -
> -root@barreleye:~# cat /sys/class/hwmon/hwmon4/temp1_input
> --270952
> -
> -Need further check on that.
> diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-bar=
releye/recipes-kernel/linux/linux-obmc_%.bbappend b/meta-openbmc-machines/m=
eta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc=
_%.bbappend
> deleted file mode 100644
> index b6e8e16..0000000
> --- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/=
recipes-kernel/linux/linux-obmc_%.bbappend
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -FILESEXTRAPATHS_prepend :=3D "${THISDIR}/linux-obmc:"
> -SRC_URI +=3D "file://barreleye.cfg"
> -SRC_URI +=3D "file://hwmon_adm1278.patch"
> diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb =
b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
> deleted file mode 100644
> index 3e74f7c..0000000
> --- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -DESCRIPTION =3D "Linux kernel for OpenBMC"
> -SECTION =3D "kernel"
> -LICENSE =3D "GPLv2"
> -
> -KBRANCH ?=3D "dev-4.3"
> -KCONFIG_MODE=3D"--alldefconfig"
> -
> -SRC_URI =3D "git://github.com/openbmc/linux;protocol=3Dgit;branch=3D${KB=
RANCH}"
> -
> -LINUX_VERSION ?=3D "4.3"
> -LINUX_VERSION_EXTENSION ?=3D "-${SRCREV}"
> -
> -SRCREV=3D"openbmc-20160222-1"
> -
> -PV =3D "${LINUX_VERSION}+git${SRCPV}"
> -
> -COMPATIBLE_MACHINE_${MACHINE} =3D "openbmc"
> -
> -inherit kernel
> -require recipes-kernel/linux/linux-yocto.inc
> -
> -do_patch_append() {
> -        for DTB in "${KERNEL_DEVICETREE}"; do
> -		DT=3D`basename ${DTB} .dtb`
> -                if [ -r "${WORKDIR}/${DT}.dts" ]; then
> -                        cp ${WORKDIR}/${DT}.dts \
> -                                ${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/=
dts
> -		fi
> -	done
> -}
> diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb =
b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
> new file mode 100644
> index 0000000..2e2c9ce
> --- /dev/null
> +++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION =3D "Linux kernel for OpenBMC"
> +SECTION =3D "kernel"
> +LICENSE =3D "GPLv2"
> +
> +KBRANCH ?=3D "dev-4.4"
> +KCONFIG_MODE=3D"--alldefconfig"
> +
> +SRC_URI =3D "git://github.com/openbmc/linux;protocol=3Dgit;branch=3D${KB=
RANCH}"
> +
> +LINUX_VERSION ?=3D "4.4"
> +LINUX_VERSION_EXTENSION ?=3D "-${SRCREV}"
> +
> +SRCREV=3D"openbmc-20160329-2"
> +
> +PV =3D "${LINUX_VERSION}+git${SRCPV}"
> +
> +COMPATIBLE_MACHINE_${MACHINE} =3D "openbmc"
> +
> +inherit kernel
> +require recipes-kernel/linux/linux-yocto.inc
> --=20
> 2.7.1
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--ijf6z65S790CMqo8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJW/qIVAAoJEKsDR8wtAMEZ1eAQAJ2ZRmgR8AFiu3bCs+qSuugD
iYrwLrVEnh8vLkx//F3a15d+xL00VlCBqVytbncHvFBdTF8AIrEHB92FuD31SKIr
TUxA9ALpfa71xlD2HNc7BmitH2wK61QoBC6kdFWg9CGfqyGJI+qK25xCA/FHengo
GtbUqjh5a3AZbmw1sisGEc12K85YVXb2AfA3jw8v8vu1jbyd1f0DLQFFOHc6i8wx
UFtn5Svxk8bJKXnLbOIUhUCteJ8yQ5IfA8RZ2ZF/YDcjHb/BMBCvxV3bmqevE3+C
yz4y2HIwhEnVu1ig9svCvK4LniCHi0YTyY/++VCyefRCzlJI0PALdz8T8A8TQXeZ
w8pnBuiMAIATVy5LQJl/PGM4mZI4dm9r3uOpWOYYosBaFKuXuSzZTRkOB46B+b5Y
XTaeNdsCOsO+qtJ+yVDAWU9NWf9rtAQbmZiLu3vvetVhP5H1SHnXWBl1nOlxFcuM
XkiV9zQQtU1bwR9Bdyw8taO7IWFoDrfjJSFhnOyNIUAQbLu6Ph+cPeY5nnsCiTU8
PXj4Cl+fOcLmpJ5PPmZIq4AS36AXD97w8URbnr2bj50BjFlh2Ep2gqu4k7akWsv2
MPYRPRnYUXAkD9RE5y3eY62MwZ+UyUS0FSwMYsgLvgWJ8L3qBH+5kBMc+59Urgg4
ony9eMOXvMZbVJLrrZV7
=pkUE
-----END PGP SIGNATURE-----

--ijf6z65S790CMqo8--

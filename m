Return-Path: <msbarth@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wkHRn6TGCzDqNx
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 06:42:45 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v58Kd2hc089798
 for <openbmc@lists.ozlabs.org>; Thu, 8 Jun 2017 16:42:43 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2aydru05se-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 08 Jun 2017 16:42:43 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <msbarth@linux.vnet.ibm.com>;
 Thu, 8 Jun 2017 14:42:42 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 8 Jun 2017 14:42:40 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v58Kgd4C19333550; Thu, 8 Jun 2017 13:42:39 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CCCB13604B;
 Thu,  8 Jun 2017 14:42:39 -0600 (MDT)
Received: from [9.10.255.51] (unknown [9.10.255.51])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 16D8D136040;
 Thu,  8 Jun 2017 14:42:39 -0600 (MDT)
Subject: Re: [PATCH] hwmon: max31785: Use standard sysfs ABI for fast rotor
 inputs
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
References: <20170608061249.29233-1-andrew@aj.id.au>
From: Matthew Barth <msbarth@linux.vnet.ibm.com>
Date: Thu, 8 Jun 2017 15:42:39 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <20170608061249.29233-1-andrew@aj.id.au>
Content-Type: multipart/alternative;
 boundary="------------D31018CAD5D3764B21461543"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17060820-0008-0000-0000-000007FAB947
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007196; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00872032; UDB=6.00433798; IPR=6.00652045; 
 BA=6.00005406; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015750; XFM=3.00000015;
 UTC=2017-06-08 20:42:41
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17060820-0009-0000-0000-00004287BA14
Message-Id: <4cf240ac-723a-5205-5e78-14bb32497d17@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-08_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706080363
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
X-List-Received-Date: Thu, 08 Jun 2017 20:42:46 -0000

This is a multi-part message in MIME format.
--------------D31018CAD5D3764B21461543
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/08/17 1:12 AM, Andrew Jeffery wrote:
> Non-standard attributes are an obstacle for userspace. Instead, use the
> standard fanX_input attributes, and number the fast-rotor values in
> [NR_CHANNEL, 2 * NR_CHANNEL - 1].
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> Matt,
>
> I have a couple of observations testing this on a Witherspoon system that has
> the necessary modifications:
>
> 1. The fast-rotor values are non-zero and vary despite the chassis power being
>     off (the slow rotor values become non-zero when the chassis is powered-on).
I worked with Jordan on this issue and it was something pointed out to 
Maxim to fix where we had verified the fix using a sampling of updated 
max31785 chips in Oct 2016. He is working with them to find out if this 
is a pre-mfg batch we have that's not 0'd out at poweroff and what the 
current set of max31785 chips FW should do. (Along with this, he's again 
going to request an updated datasheet for rev 0x3040).
> 2. The fast-rotor values seem to be 'sticky' - sometimes they don't vary as
>     often as I would expect (e.g. in fan ramp- up or down).
Not sure what you mean by 'sticky', but during Jordan and I 
investigating, we found that the fast rotor 2bytes were reading 0's 
during any speed change (up or down) and would only continue providing 
the tach feedback once the target speed had been deemed reached. This is 
another point Jordan is bringing up to Maxim, however this should not 
preclude us from getting these fast rotor feedbacks enabled as we have 
application code in place that does not mark these as faulted due to this.
> 2. The fast-rotor attributes appear to correspond to the slow rotor values.
What do you mean by attributes here? What were you seeing?
Just for info...the faster of tach feedbacks (fan/f/_input) should 
always be in the 'upper' 2 bytes of the 0x90 reg and the slower 
(fan/s/_input) should always be the 'lower' 2 bytes according to Maxim 
(and what I verified last year with this 0x3040 rev update). So for the 
associated fan/x/_target, there will be differing speeds between the 
fan/s/_input and fan/f/_input where these should be within a 15% 
deviation of the given fan/x/_target.

>
> On point 1, here's what I see out of the box:
>
>      root@witherspoon:/sys/bus/i2c/drivers/max31785/3-0052/hwmon/hwmon1# grep '.*' fan*
>      fan10_input:10190
>      fan11_input:0
>      fan12_input:0
>      fan1_fault:0
>      fan1_input:10714
>      fan1_pulses:2
>      fan1_target:10500
>      fan2_fault:0
>      fan2_input:10416
>      fan2_pulses:2
>      fan2_target:10500
>      fan3_fault:0
>      fan3_input:10744
>      fan3_pulses:2
>      fan3_target:10500
>      fan4_fault:0
>      fan4_input:10806
>      fan4_pulses:2
>      fan4_target:10500
>      fan5_fault:0
>      fan5_input:0
>      fan5_pulses:1
>      fan5_target:1638
>      fan6_fault:0
>      fan6_input:0
>      fan6_pulses:1
>      fan6_target:1638
>      fan7_input:10135
>      fan8_input:9920
>      fan9_input:10162
>
> Expanding on point 2, I issued `obmcutil chassison`, then proceeded to set
> progressively increasing fan targets:
>
>      root@witherspoon:/sys/bus/i2c/drivers/max31785/3-0052/hwmon/hwmon1# grep '.*' fan*
>      fan10_input:7142
>      fan11_input:0
>      fan12_input:0
>      fan1_fault:0
>      fan1_input:6432
>      fan1_pulses:2
>      fan1_target:6500
>      fan2_fault:0
>      fan2_input:9816
>      fan2_pulses:2
>      fan2_target:9500
>      fan3_fault:0
>      fan3_input:8426
>      fan3_pulses:2
>      fan3_target:8500
>      fan4_fault:0
>      fan4_input:7515
>      fan4_pulses:2
>      fan4_target:7500
>      fan5_fault:0
>      fan5_input:0
>      fan5_pulses:1
>      fan5_target:1638
>      fan6_fault:0
>      fan6_input:0
>      fan6_pulses:1
>      fan6_target:1638
For witherspoon, fan5_target & fan6_target are not wired up so that 1638 
target value is not valid and are never set (so it must be some default 
within the max31785). So what did we decide on how these sysfs file 
names will be associated between _target and _input(s)? From our slack 
discussion/, ie) fan1_input & fan2_input is the pair of feedbacks 
associated with fan1_target/ is that suppose to be true here?
>      fan7_input:6009
>      fan8_input:9351
>      fan9_input:7944
>
> The fanX_input values for X in [6, 10] are consistently lower than X in [1, 4].
There is a chance this is correct as until the thermal team examines the 
air flow, its not unheard of to have back pressure on fans causing them 
to actually spin slower, but regardless they should be within the 15% 
target deviation.
It would be more beneficial to group each _input with its corresponding 
_target cuz it seems here, for example, that fan7_input & fan1_input are 
associated with fan1_target?
>
>   drivers/hwmon/max31785.c | 103 +++++++++++++++++++++++++----------------------
>   1 file changed, 54 insertions(+), 49 deletions(-)
>
> diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
> index ed47d08a0ada..ca69d0974c00 100644
> --- a/drivers/hwmon/max31785.c
> +++ b/drivers/hwmon/max31785.c
> @@ -88,10 +88,14 @@ struct max31785 {
>   	u8	mfr_fan_config[NR_CHANNEL];
>   	u8	fault_status[NR_CHANNEL];
>   	u16	pwm[NR_CHANNEL];
> -	u16	tach_rpm[NR_CHANNEL];
> -	u16	tach_rpm_fast[NR_CHANNEL];
> +	u16	tach_rpm[NR_CHANNEL * 2];
>   };
>
> +static inline bool max31785_has_fast_rotor(struct max31785 *data)
> +{
> +	return !!(data->capabilities & MAX31785_CAP_FAST_ROTOR);
> +}
> +
>   static int max31785_set_page(struct i2c_client *client,
>   				u8 page)
>   {
> @@ -188,14 +192,14 @@ static int max31785_update_fan_speed(struct max31785 *data, u8 fan)
>   	if (rc)
>   		return rc;
>
> -	if (data->capabilities & MAX31785_CAP_FAST_ROTOR) {
> +	if (max31785_has_fast_rotor(data)) {
>   		rc = max31785_smbus_read_long_data(data->client,
>   				MAX31785_REG_FAN_SPEED_1);
>   		if (rc < 0)
>   			return rc;
>
>   		data->tach_rpm[fan] = rc & 0xffff;
> -		data->tach_rpm_fast[fan] = (rc >> 16) & 0xffff;
> +		data->tach_rpm[NR_CHANNEL + fan] = (rc >> 16) & 0xffff;
>
>   		return rc;
>   	}
> @@ -475,7 +479,7 @@ static int max31785_detect(struct i2c_client *client,
>   	return 0;
>   }
>
> -static const u32 max31785_fan_config[] = {
> +static const u32 max31785_fan_config_0x3030[] = {
>   	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
>   	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
>   	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
> @@ -485,9 +489,30 @@ static const u32 max31785_fan_config[] = {
>   	0
>   };
>
> -static const struct hwmon_channel_info max31785_fan = {
> +static const struct hwmon_channel_info max31785_fan_0x3030 = {
>   	.type = hwmon_fan,
> -	.config = max31785_fan_config,
> +	.config = max31785_fan_config_0x3030,
> +};
> +
> +static const u32 max31785_fan_config_0x3040[] = {
> +	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
> +	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
> +	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
> +	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
> +	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
> +	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
> +	HWMON_F_INPUT,
> +	HWMON_F_INPUT,
> +	HWMON_F_INPUT,
> +	HWMON_F_INPUT,
> +	HWMON_F_INPUT,
> +	HWMON_F_INPUT,
> +	0
> +};
> +
> +static const struct hwmon_channel_info max31785_fan_0x3040 = {
> +	.type = hwmon_fan,
> +	.config = max31785_fan_config_0x3040,
>   };
>
>   static const u32 max31785_pwm_config[] = {
> @@ -505,8 +530,14 @@ static const struct hwmon_channel_info max31785_pwm = {
>   	.config = max31785_pwm_config
>   };
>
> -static const struct hwmon_channel_info *max31785_info[] = {
> -	&max31785_fan,
> +static const struct hwmon_channel_info *max31785_info_0x3030[] = {
> +	&max31785_fan_0x3030,
> +	&max31785_pwm,
> +	NULL,
> +};
> +
> +static const struct hwmon_channel_info *max31785_info_0x3040[] = {
> +	&max31785_fan_0x3040,
>   	&max31785_pwm,
>   	NULL,
>   };
> @@ -562,15 +593,6 @@ static int max31785_read_fan(struct max31785 *data, u32 attr, int channel,
>   	return rc;
>   }
>
> -static int max31785_fan_get_fast(struct device *dev,
> -				struct device_attribute *attr, char *buf)
> -{
> -	struct sensor_device_attribute_2 *attr2 = to_sensor_dev_attr_2(attr);
> -	struct max31785 *data = max31785_update_device(dev);
> -
> -	return sprintf(buf, "%d\n", data->tach_rpm_fast[attr2->index]);
> -}
> -
>   static int max31785_read_pwm(struct max31785 *data, u32 attr, int channel,
>   		long *val)
>   {
> @@ -723,9 +745,14 @@ static const struct hwmon_ops max31785_hwmon_ops = {
>   	.write = max31785_write,
>   };
>
> -static const struct hwmon_chip_info max31785_chip_info = {
> +static const struct hwmon_chip_info max31785_chip_info_0x3030 = {
>   	.ops = &max31785_hwmon_ops,
> -	.info = max31785_info,
> +	.info = max31785_info_0x3030,
> +};
> +
> +static const struct hwmon_chip_info max31785_chip_info_0x3040 = {
> +	.ops = &max31785_hwmon_ops,
> +	.info = max31785_info_0x3040,
>   };
>
>   static ssize_t max31785_fault_resp_store(struct device *dev,
> @@ -802,31 +829,7 @@ static ssize_t max31785_fault_resp_show(struct device *dev,
>   }
>
>   static DEVICE_ATTR(fault_resp, 0644, max31785_fault_resp_show,
> -		max31785_fault_resp_store);
> -
> -static SENSOR_DEVICE_ATTR(fan1_input_fast, 0444, max31785_fan_get_fast,
> -		NULL, 0);
> -static SENSOR_DEVICE_ATTR(fan2_input_fast, 0444, max31785_fan_get_fast,
> -		NULL, 1);
> -static SENSOR_DEVICE_ATTR(fan3_input_fast, 0444, max31785_fan_get_fast,
> -		NULL, 2);
> -static SENSOR_DEVICE_ATTR(fan4_input_fast, 0444, max31785_fan_get_fast,
> -		NULL, 3);
> -static SENSOR_DEVICE_ATTR(fan5_input_fast, 0444, max31785_fan_get_fast,
> -		NULL, 4);
> -static SENSOR_DEVICE_ATTR(fan6_input_fast, 0444, max31785_fan_get_fast,
> -		NULL, 5);
> -
> -static struct attribute *max31785_attrs[] = {
> -	&sensor_dev_attr_fan1_input_fast.dev_attr.attr,
> -	&sensor_dev_attr_fan2_input_fast.dev_attr.attr,
> -	&sensor_dev_attr_fan3_input_fast.dev_attr.attr,
> -	&sensor_dev_attr_fan4_input_fast.dev_attr.attr,
> -	&sensor_dev_attr_fan5_input_fast.dev_attr.attr,
> -	&sensor_dev_attr_fan6_input_fast.dev_attr.attr,
> -	NULL,
> -};
> -ATTRIBUTE_GROUPS(max31785);
> +		   max31785_fault_resp_store);
>
>   static int max31785_get_capabilities(struct max31785 *data)
>   {
> @@ -846,7 +849,7 @@ static int max31785_probe(struct i2c_client *client,
>   			  const struct i2c_device_id *id)
>   {
>   	struct i2c_adapter *adapter = client->adapter;
> -	const struct attribute_group **extra_groups;
> +	const struct hwmon_chip_info *chip;
>   	struct device *dev = &client->dev;
>   	struct device *hwmon_dev;
>   	struct max31785 *data;
> @@ -871,15 +874,17 @@ static int max31785_probe(struct i2c_client *client,
>   	if (rc < 0)
>   		return rc;
>
> -	if (data->capabilities & MAX31785_CAP_FAST_ROTOR)
> -		extra_groups = max31785_groups;
> +	if (max31785_has_fast_rotor(data))
> +		chip = &max31785_chip_info_0x3040;
> +	else
> +		chip = &max31785_chip_info_0x3030;
>
>   	rc = device_create_file(dev, &dev_attr_fault_resp);
>   	if (rc)
>   		return rc;
>
>   	hwmon_dev = devm_hwmon_device_register_with_info(dev,
> -			client->name, data, &max31785_chip_info, extra_groups);
> +			client->name, data, chip, NULL);
>
>   	return PTR_ERR_OR_ZERO(hwmon_dev);
>   }
Thanks,

Matt

--------------D31018CAD5D3764B21461543
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 06/08/17 1:12 AM, Andrew Jeffery
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20170608061249.29233-1-andrew@aj.id.au">
      <pre wrap="">Non-standard attributes are an obstacle for userspace. Instead, use the
standard fanX_input attributes, and number the fast-rotor values in
[NR_CHANNEL, 2 * NR_CHANNEL - 1].

Signed-off-by: Andrew Jeffery <a class="moz-txt-link-rfc2396E" href="mailto:andrew@aj.id.au">&lt;andrew@aj.id.au&gt;</a>
---
Matt,

I have a couple of observations testing this on a Witherspoon system that has
the necessary modifications:

1. The fast-rotor values are non-zero and vary despite the chassis power being
   off (the slow rotor values become non-zero when the chassis is powered-on).</pre>
    </blockquote>
    I worked with Jordan on this issue and it was something pointed out
    to Maxim to fix where we had verified the fix using a sampling of
    updated max31785 chips in Oct 2016. He is working with them to find
    out if this is a pre-mfg batch we have that's not 0'd out at
    poweroff and what the current set of max31785 chips FW should do.
    (Along with this, he's again going to request an updated datasheet
    for rev 0x3040).<br>
    <blockquote type="cite"
      cite="mid:20170608061249.29233-1-andrew@aj.id.au">
      <pre wrap="">
2. The fast-rotor values seem to be 'sticky' - sometimes they don't vary as
   often as I would expect (e.g. in fan ramp- up or down).</pre>
    </blockquote>
    Not sure what you mean by 'sticky', but during Jordan and I
    investigating, we found that the fast rotor 2bytes were reading 0's
    during any speed change (up or down) and would only continue
    providing the tach feedback once the target speed had been deemed
    reached. This is another point Jordan is bringing up to Maxim,
    however this should not preclude us from getting these fast rotor
    feedbacks enabled as we have application code in place that does not
    mark these as faulted due to this.<br>
    <blockquote type="cite"
      cite="mid:20170608061249.29233-1-andrew@aj.id.au">
      <pre wrap="">
2. The fast-rotor attributes appear to correspond to the slow rotor values.</pre>
    </blockquote>
    What do you mean by attributes here? What were you seeing?<br>
    Just for info...the faster of tach feedbacks (fan<i>f</i>_input)
    should always be in the 'upper' 2 bytes of the 0x90 reg and the
    slower (fan<i>s</i>_input) should always be the 'lower' 2 bytes
    according to Maxim (and what I verified last year with this 0x3040
    rev update). So for the associated fan<i>x</i>_target, there will be
    differing speeds between the fan<i>s</i>_input and fan<i>f</i>_input
    where these should be within a 15% deviation of the given fan<i>x</i>_target.<br>
    <br>
    <blockquote type="cite"
      cite="mid:20170608061249.29233-1-andrew@aj.id.au">
      <pre wrap="">

On point 1, here's what I see out of the box:

    root@witherspoon:/sys/bus/i2c/drivers/max31785/3-0052/hwmon/hwmon1# grep '.*' fan*
    fan10_input:10190
    fan11_input:0
    fan12_input:0
    fan1_fault:0
    fan1_input:10714
    fan1_pulses:2
    fan1_target:10500
    fan2_fault:0
    fan2_input:10416
    fan2_pulses:2
    fan2_target:10500
    fan3_fault:0
    fan3_input:10744
    fan3_pulses:2
    fan3_target:10500
    fan4_fault:0
    fan4_input:10806
    fan4_pulses:2
    fan4_target:10500
    fan5_fault:0
    fan5_input:0
    fan5_pulses:1
    fan5_target:1638
    fan6_fault:0
    fan6_input:0
    fan6_pulses:1
    fan6_target:1638
    fan7_input:10135
    fan8_input:9920
    fan9_input:10162

Expanding on point 2, I issued `obmcutil chassison`, then proceeded to set
progressively increasing fan targets:

    root@witherspoon:/sys/bus/i2c/drivers/max31785/3-0052/hwmon/hwmon1# grep '.*' fan*
    fan10_input:7142
    fan11_input:0
    fan12_input:0
    fan1_fault:0
    fan1_input:6432
    fan1_pulses:2
    fan1_target:6500
    fan2_fault:0
    fan2_input:9816
    fan2_pulses:2
    fan2_target:9500
    fan3_fault:0
    fan3_input:8426
    fan3_pulses:2
    fan3_target:8500
    fan4_fault:0
    fan4_input:7515
    fan4_pulses:2
    fan4_target:7500
    fan5_fault:0
    fan5_input:0
    fan5_pulses:1
    fan5_target:1638
    fan6_fault:0
    fan6_input:0
    fan6_pulses:1
    fan6_target:1638</pre>
    </blockquote>
    For witherspoon, fan5_target &amp; fan6_target are not wired up so
    that 1638 target value is not valid and are never set (so it must be
    some default within the max31785). So what did we decide on how
    these sysfs file names will be associated between _target and
    _input(s)? From our slack discussion<i>, ie) fan1_input &amp;
      fan2_input is the pair of feedbacks associated with fan1_target</i>
    is that suppose to be true here?<br>
    <blockquote type="cite"
      cite="mid:20170608061249.29233-1-andrew@aj.id.au">
      <pre wrap="">
    fan7_input:6009
    fan8_input:9351
    fan9_input:7944

The fanX_input values for X in [6, 10] are consistently lower than X in [1, 4].</pre>
    </blockquote>
    There is a chance this is correct as until the thermal team examines
    the air flow, its not unheard of to have back pressure on fans
    causing them to actually spin slower, but regardless they should be
    within the 15% target deviation.<br>
    It would be more beneficial to group each _input with its
    corresponding _target cuz it seems here, for example, that
    fan7_input &amp; fan1_input are associated with fan1_target?<br>
    <blockquote type="cite"
      cite="mid:20170608061249.29233-1-andrew@aj.id.au">
      <pre wrap="">

 drivers/hwmon/max31785.c | 103 +++++++++++++++++++++++++----------------------
 1 file changed, 54 insertions(+), 49 deletions(-)

diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
index ed47d08a0ada..ca69d0974c00 100644
--- a/drivers/hwmon/max31785.c
+++ b/drivers/hwmon/max31785.c
@@ -88,10 +88,14 @@ struct max31785 {
 	u8	mfr_fan_config[NR_CHANNEL];
 	u8	fault_status[NR_CHANNEL];
 	u16	pwm[NR_CHANNEL];
-	u16	tach_rpm[NR_CHANNEL];
-	u16	tach_rpm_fast[NR_CHANNEL];
+	u16	tach_rpm[NR_CHANNEL * 2];
 };

+static inline bool max31785_has_fast_rotor(struct max31785 *data)
+{
+	return !!(data-&gt;capabilities &amp; MAX31785_CAP_FAST_ROTOR);
+}
+
 static int max31785_set_page(struct i2c_client *client,
 				u8 page)
 {
@@ -188,14 +192,14 @@ static int max31785_update_fan_speed(struct max31785 *data, u8 fan)
 	if (rc)
 		return rc;

-	if (data-&gt;capabilities &amp; MAX31785_CAP_FAST_ROTOR) {
+	if (max31785_has_fast_rotor(data)) {
 		rc = max31785_smbus_read_long_data(data-&gt;client,
 				MAX31785_REG_FAN_SPEED_1);
 		if (rc &lt; 0)
 			return rc;

 		data-&gt;tach_rpm[fan] = rc &amp; 0xffff;
-		data-&gt;tach_rpm_fast[fan] = (rc &gt;&gt; 16) &amp; 0xffff;
+		data-&gt;tach_rpm[NR_CHANNEL + fan] = (rc &gt;&gt; 16) &amp; 0xffff;

 		return rc;
 	}
@@ -475,7 +479,7 @@ static int max31785_detect(struct i2c_client *client,
 	return 0;
 }

-static const u32 max31785_fan_config[] = {
+static const u32 max31785_fan_config_0x3030[] = {
 	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
 	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
 	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
@@ -485,9 +489,30 @@ static const u32 max31785_fan_config[] = {
 	0
 };

-static const struct hwmon_channel_info max31785_fan = {
+static const struct hwmon_channel_info max31785_fan_0x3030 = {
 	.type = hwmon_fan,
-	.config = max31785_fan_config,
+	.config = max31785_fan_config_0x3030,
+};
+
+static const u32 max31785_fan_config_0x3040[] = {
+	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
+	HWMON_F_INPUT,
+	HWMON_F_INPUT,
+	HWMON_F_INPUT,
+	HWMON_F_INPUT,
+	HWMON_F_INPUT,
+	HWMON_F_INPUT,
+	0
+};
+
+static const struct hwmon_channel_info max31785_fan_0x3040 = {
+	.type = hwmon_fan,
+	.config = max31785_fan_config_0x3040,
 };

 static const u32 max31785_pwm_config[] = {
@@ -505,8 +530,14 @@ static const struct hwmon_channel_info max31785_pwm = {
 	.config = max31785_pwm_config
 };

-static const struct hwmon_channel_info *max31785_info[] = {
-	&amp;max31785_fan,
+static const struct hwmon_channel_info *max31785_info_0x3030[] = {
+	&amp;max31785_fan_0x3030,
+	&amp;max31785_pwm,
+	NULL,
+};
+
+static const struct hwmon_channel_info *max31785_info_0x3040[] = {
+	&amp;max31785_fan_0x3040,
 	&amp;max31785_pwm,
 	NULL,
 };
@@ -562,15 +593,6 @@ static int max31785_read_fan(struct max31785 *data, u32 attr, int channel,
 	return rc;
 }

-static int max31785_fan_get_fast(struct device *dev,
-				struct device_attribute *attr, char *buf)
-{
-	struct sensor_device_attribute_2 *attr2 = to_sensor_dev_attr_2(attr);
-	struct max31785 *data = max31785_update_device(dev);
-
-	return sprintf(buf, "%d\n", data-&gt;tach_rpm_fast[attr2-&gt;index]);
-}
-
 static int max31785_read_pwm(struct max31785 *data, u32 attr, int channel,
 		long *val)
 {
@@ -723,9 +745,14 @@ static const struct hwmon_ops max31785_hwmon_ops = {
 	.write = max31785_write,
 };

-static const struct hwmon_chip_info max31785_chip_info = {
+static const struct hwmon_chip_info max31785_chip_info_0x3030 = {
 	.ops = &amp;max31785_hwmon_ops,
-	.info = max31785_info,
+	.info = max31785_info_0x3030,
+};
+
+static const struct hwmon_chip_info max31785_chip_info_0x3040 = {
+	.ops = &amp;max31785_hwmon_ops,
+	.info = max31785_info_0x3040,
 };

 static ssize_t max31785_fault_resp_store(struct device *dev,
@@ -802,31 +829,7 @@ static ssize_t max31785_fault_resp_show(struct device *dev,
 }

 static DEVICE_ATTR(fault_resp, 0644, max31785_fault_resp_show,
-		max31785_fault_resp_store);
-
-static SENSOR_DEVICE_ATTR(fan1_input_fast, 0444, max31785_fan_get_fast,
-		NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_input_fast, 0444, max31785_fan_get_fast,
-		NULL, 1);
-static SENSOR_DEVICE_ATTR(fan3_input_fast, 0444, max31785_fan_get_fast,
-		NULL, 2);
-static SENSOR_DEVICE_ATTR(fan4_input_fast, 0444, max31785_fan_get_fast,
-		NULL, 3);
-static SENSOR_DEVICE_ATTR(fan5_input_fast, 0444, max31785_fan_get_fast,
-		NULL, 4);
-static SENSOR_DEVICE_ATTR(fan6_input_fast, 0444, max31785_fan_get_fast,
-		NULL, 5);
-
-static struct attribute *max31785_attrs[] = {
-	&amp;sensor_dev_attr_fan1_input_fast.dev_attr.attr,
-	&amp;sensor_dev_attr_fan2_input_fast.dev_attr.attr,
-	&amp;sensor_dev_attr_fan3_input_fast.dev_attr.attr,
-	&amp;sensor_dev_attr_fan4_input_fast.dev_attr.attr,
-	&amp;sensor_dev_attr_fan5_input_fast.dev_attr.attr,
-	&amp;sensor_dev_attr_fan6_input_fast.dev_attr.attr,
-	NULL,
-};
-ATTRIBUTE_GROUPS(max31785);
+		   max31785_fault_resp_store);

 static int max31785_get_capabilities(struct max31785 *data)
 {
@@ -846,7 +849,7 @@ static int max31785_probe(struct i2c_client *client,
 			  const struct i2c_device_id *id)
 {
 	struct i2c_adapter *adapter = client-&gt;adapter;
-	const struct attribute_group **extra_groups;
+	const struct hwmon_chip_info *chip;
 	struct device *dev = &amp;client-&gt;dev;
 	struct device *hwmon_dev;
 	struct max31785 *data;
@@ -871,15 +874,17 @@ static int max31785_probe(struct i2c_client *client,
 	if (rc &lt; 0)
 		return rc;

-	if (data-&gt;capabilities &amp; MAX31785_CAP_FAST_ROTOR)
-		extra_groups = max31785_groups;
+	if (max31785_has_fast_rotor(data))
+		chip = &amp;max31785_chip_info_0x3040;
+	else
+		chip = &amp;max31785_chip_info_0x3030;

 	rc = device_create_file(dev, &amp;dev_attr_fault_resp);
 	if (rc)
 		return rc;

 	hwmon_dev = devm_hwmon_device_register_with_info(dev,
-			client-&gt;name, data, &amp;max31785_chip_info, extra_groups);
+			client-&gt;name, data, chip, NULL);

 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
</pre>
    </blockquote>
    Thanks,<br>
    <br>
    Matt<br>
  </body>
</html>

--------------D31018CAD5D3764B21461543--

Return-Path: <linux@roeck-us.net>
Received: from bh-25.webhostbox.net (bh-25.webhostbox.net [208.91.199.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x66zn68xrzDqCZ
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2017 13:30:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.b="pDtd9Uor";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FJgP90l60bsRWKNny5Snv3cCOldUWUliGtC9Vir/fqg=; b=pDtd9UorDy38P4Tez2IbWfMSTq
 o0tA1USmQDMXVSwpFfcZnb9FVK0fypYmxp8UrMpzKcmmhZOsTitL2by0oKcsp5h+cH5GKcLta4POE
 TqazJhy5TOWtbiqmg0hbM66gmuflI/uJmTqHvSbQgD9FZkt7hU/ppUPK0aiNSZ1jzXfAUGyyRIPS4
 YDaPlBmRMcLqL0bHue1zWjwBc0DlrxQ9S6k6a9NiZrdsGUmCNUj38l7bKJusYbuM92Q+U2cpxy+hX
 h1m/9sn7uCCEjFGGNPv+bfo1x8ofk6XXyJkctuOKv7eySMZCz8azA2sYmy8DMoUs6BGk7xaCmEG/k
 xz1j3uIg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:36196 helo=server.roeck-us.net)
 by bh-25.webhostbox.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.89) (envelope-from <linux@roeck-us.net>)
 id 1dUlsn-000pPD-Cx; Tue, 11 Jul 2017 03:30:42 +0000
Subject: Re: [patch v1] hwmon: (aspeed-pwm-tacho) cooling device support.
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: Jean Delvare <jdelvare@suse.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Patrick Venture <venture@google.com>, Vadim Pasternak <vadimp@mellanox.com>
References: <20170706142338.32732-1-c_mykolak@mellanox.com>
 <20170707180844.GA25433@roeck-us.net>
 <DB5PR05MB1224342E024F68EE43790E53EFA90@DB5PR05MB1224.eurprd05.prod.outlook.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <c4cd39fa-74d8-1a86-932d-a894e4085580@roeck-us.net>
Date: Mon, 10 Jul 2017 20:30:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <DB5PR05MB1224342E024F68EE43790E53EFA90@DB5PR05MB1224.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated_sender: linux@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
 linux@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: linux@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
X-List-Received-Date: Tue, 11 Jul 2017 03:30:46 -0000

On 07/10/2017 07:36 AM, Mykola Kostenok wrote:
>> -----Original Message-----
>> From: Guenter Roeck [mailto:linux@roeck-us.net]
>> Sent: Friday, July 7, 2017 9:09 PM
>> To: Mykola Kostenok <c_mykolak@mellanox.com>
>> Cc: Jean Delvare <jdelvare@suse.com>; linux-hwmon@vger.kernel.org;
>> Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>;
>> openbmc@lists.ozlabs.org; Patrick Venture <venture@google.com>; Vadim
>> Pasternak <vadimp@mellanox.com>
>> Subject: Re: [patch v1] hwmon: (aspeed-pwm-tacho) cooling device support.
>>
>> On Thu, Jul 06, 2017 at 05:23:38PM +0300, Mykola Kostenok wrote:
>>> Add support in aspeed-pwm-tacho driver for cooling device creation.
>>> This cooling device could be bound to a thermal zone for the thermal
>>> control. Device will appear in /sys/class/thermal folder as
>>> cooling_deviceX. Then it could be bound to particular thermal zones.
>>> Allow specification of the cooling levels vector - PWM duty cycle
>>> values in a range from 0 to 255 which correspond to thermal cooling
>>> states.
>>>
>>> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
>>> ---
>>>   .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt |  52 ++++++--
>>
>> You'll need devicetree maintainer approval for any devicetree changes.
>>
>>>   drivers/hwmon/aspeed-pwm-tacho.c                   | 141
>> ++++++++++++++++++++-
>>>   2 files changed, 179 insertions(+), 14 deletions(-)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
>>> b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
>>> index cf44605..293a994 100644
>>> --- a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
>>> +++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-
>> tacho.txt
>>> @@ -23,9 +23,14 @@ Required properties for pwm-tacho node:
>>>   - clocks : a fixed clock providing input clock frequency(PWM
>>>   	   and Fan Tach clock)
>>>
>>> -fan subnode format:
>>> +tach-channels subnode format:
>>
>> I don't like the notion of renaming "fan subnode" to "tach-channels
>> subnode". To me that is just a personal preference. Tomorrow I might get
>> another patch changing it back or changing it to something else.
>>
>> But, as mentioned above, you'll need DT maintaier approval for those
>> changes in the first place.
>>
>> Guenter
>>
> 
> Hi, Guenter.
> Thank you for reply.
> 
> Actually we didn't rename fan subnode. We add one more level hierarchy
> tach-channels and put fan subnodes inside it.

Hmm. The above very much looks like a rename to me.

> And also we add pwm-channels subnode with pwm subnodes inside
> for cooling device.
> 
> We found issue with of_node_put in this patch, so we want to send
> you patch v2.
> 
> Do we need send this changes in 2 separated patches,
> one with driver aspeed-pwm-tacho.c to you, and another
> with doc aspeed-pwm-tacho.txt to DT maintainer?
> 
Yes.

Guenter

> Best regards. Mykola Kostenok.
> 
>>>   ===================
>>> -Under fan subnode there can upto 8 child nodes, with each child node
>>> +Required properties for tach-channels node:
>>> +- #address-cells : should be 1.
>>> +
>>> +- #size-cells : should be 0.
>>> +
>>> +Under tach-channels subnode there can be upto 8 child nodes, with
>>> +each child node
>>>   representing a fan. If there are 8 fans each fan can have one PWM
>>> port and  one/two Fan tach inputs.
>>>
>>> @@ -39,6 +44,22 @@ Required properties for each child node:
>>>   		Fan tach channel 0 and 15 indicating Fan tach channel 15.
>>>   		Atleast one Fan tach input channel is required.
>>>
>>> +pwm-channels subnode format:
>>> +Under pwm-channels subnode there can be pwm child nodes.
>>> +Required properties for tach-channels node:
>>> +- #address-cells : should be 1.
>>> +
>>> +- #size-cells : should be 0.
>>> +
>>> +- #cooling-cells : should be 2;
>>> +
>>> +pwm subnode format:
>>> +- reg : should be <0x00>.
>>> +
>>> +- cooling-levels      : PWM duty cycle values in a range from 0 to 255
>>> +			which correspond to thermal cooling states.
>>> +
>>> +
>>>   Examples:
>>>
>>>   pwm_tacho_fixed_clk: fixedclk {
>>> @@ -55,14 +76,25 @@ pwm_tacho: pwmtachocontroller@1e786000 {
>>>   	clocks = <&pwm_tacho_fixed_clk>;
>>>   	pinctrl-names = "default";
>>>   	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
>>> -
>>> -	fan@0 {
>>> -		reg = <0x00>;
>>> -		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
>>> +	tach-channels {
>>> +		#address-cells = <1>;
>>> +		#size-cells = <0>;
>>> +		fan@0 {
>>> +			reg = <0x00>;
>>> +			aspeed,fan-tach-ch = /bits/ 8 <0x00>;
>>> +		};
>>> +		fan@1 {
>>> +			reg = <0x01>;
>>> +			aspeed,fan-tach-ch = /bits/ 8 <0x01 0x02>;
>>> +		};
>>>   	};
>>> -
>>> -	fan@1 {
>>> -		reg = <0x01>;
>>> -		aspeed,fan-tach-ch = /bits/ 8 <0x01 0x02>;
>>> +	pwm-channels {
>>> +		#address-cells = <1>;
>>> +		#size-cells = <0>;
>>> +		#cooling-cells = <2>;
>>> +		pwm@0 {
>>> +			reg = <0x00>;
>>> +			cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
>>> +		};
>>>   	};
>>>   };
>>> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c
>>> b/drivers/hwmon/aspeed-pwm-tacho.c
>>> index ddfe66b..c10a37e 100644
>>> --- a/drivers/hwmon/aspeed-pwm-tacho.c
>>> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
>>> @@ -20,6 +20,7 @@
>>>   #include <linux/platform_device.h>
>>>   #include <linux/sysfs.h>
>>>   #include <linux/regmap.h>
>>> +#include <linux/thermal.h>
>>>
>>>   /* ASPEED PWM & FAN Tach Register Definition */
>>>   #define ASPEED_PTCR_CTRL		0x00
>>> @@ -166,6 +167,16 @@
>>>   /* How long we sleep in us while waiting for an RPM result. */
>>>   #define ASPEED_RPM_STATUS_SLEEP_USEC	500
>>>
>>> +struct aspeed_cooling_device {
>>> +	char name[16];
>>> +	struct aspeed_pwm_tacho_data *priv;
>>> +	struct thermal_cooling_device *tcdev;
>>> +	int pwm_port;
>>> +	u8 *cooling_levels;
>>> +	u8 max_state;
>>> +	u8 cur_state;
>>> +};
>>> +
>>>   struct aspeed_pwm_tacho_data {
>>>   	struct regmap *regmap;
>>>   	unsigned long clk_freq;
>>> @@ -180,6 +191,7 @@ struct aspeed_pwm_tacho_data {
>>>   	u8 pwm_port_type[8];
>>>   	u8 pwm_port_fan_ctrl[8];
>>>   	u8 fan_tach_ch_source[16];
>>> +	struct aspeed_cooling_device *cdev[8];
>>>   	const struct attribute_group *groups[3];  };
>>>
>>> @@ -794,10 +806,111 @@ static int aspeed_create_fan(struct device *dev,
>>>   	return 0;
>>>   }
>>>
>>> +static int
>>> +aspeed_pwm_cz_get_max_state(struct thermal_cooling_device *tcdev,
>>> +			    unsigned long *state)
>>> +{
>>> +	struct aspeed_cooling_device *cdev =
>>> +				(struct aspeed_cooling_device *)tcdev-
>>> devdata;
>>> +
>>> +	*state = cdev->max_state;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int
>>> +aspeed_pwm_cz_get_cur_state(struct thermal_cooling_device *tcdev,
>>> +			    unsigned long *state)
>>> +{
>>> +	struct aspeed_cooling_device *cdev =
>>> +				(struct aspeed_cooling_device *)tcdev-
>>> devdata;
>>> +
>>> +	*state = cdev->cur_state;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int
>>> +aspeed_pwm_cz_set_cur_state(struct thermal_cooling_device *tcdev,
>>> +			    unsigned long state)
>>> +{
>>> +	struct aspeed_cooling_device *cdev =
>>> +				(struct aspeed_cooling_device *)tcdev-
>>> devdata;
>>> +
>>> +	if (state > cdev->max_state)
>>> +		return -EINVAL;
>>> +
>>> +	cdev->cur_state = state;
>>> +	cdev->priv->pwm_port_fan_ctrl[cdev->pwm_port] = *(cdev-
>>> cooling_levels
>>> +							  + cdev->cur_state);
>>> +	aspeed_set_pwm_port_fan_ctrl(cdev->priv, cdev->pwm_port,
>>> +				     *(cdev->cooling_levels +
>>> +				       cdev->cur_state));
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct thermal_cooling_device_ops aspeed_pwm_cool_ops =
>> {
>>> +	.get_max_state = aspeed_pwm_cz_get_max_state,
>>> +	.get_cur_state = aspeed_pwm_cz_get_cur_state,
>>> +	.set_cur_state = aspeed_pwm_cz_set_cur_state, };
>>> +
>>> +static int aspeed_create_pwm_cooling(struct device *dev,
>>> +				     struct device_node *child,
>>> +				     struct aspeed_pwm_tacho_data *priv) {
>>> +	u32 pwm_port;
>>> +	int ret;
>>> +
>>> +	ret = of_property_read_u32(child, "reg", &pwm_port);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = of_property_count_u8_elems(child, "cooling-levels");
>>> +	if (ret <= 0) {
>>> +		dev_err(dev, "Wrong cooling-levels data.\n");
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	priv->cdev[pwm_port] = devm_kzalloc(dev, sizeof(*priv-
>>> cdev[pwm_port]),
>>> +					    GFP_KERNEL);
>>> +	if (!priv->cdev[pwm_port])
>>> +		return -ENOMEM;
>>> +
>>> +	priv->cdev[pwm_port]->cooling_levels = devm_kzalloc(dev, ret *
>>> +							    sizeof(u8),
>>> +							    GFP_KERNEL);
>>> +	if (!priv->cdev[pwm_port]->cooling_levels)
>>> +		return -ENOMEM;
>>> +
>>> +	priv->cdev[pwm_port]->max_state = ret - 1;
>>> +	ret = of_property_read_u8_array(child, "cooling-levels",
>>> +					priv->cdev[pwm_port]-
>>> cooling_levels,
>>> +					ret);
>>> +	if (ret) {
>>> +		dev_err(dev, "Property 'cooling-levels' cannot be read.\n");
>>> +		return ret;
>>> +	}
>>> +
>>> +	sprintf(priv->cdev[pwm_port]->name, "%s%d", child->name,
>> pwm_port);
>>> +	priv->cdev[pwm_port]->tcdev =
>> thermal_of_cooling_device_register(child,
>>> +						priv->cdev[pwm_port]-
>>> name,
>>> +						priv->cdev[pwm_port],
>>> +						&aspeed_pwm_cool_ops);
>>> +	if (PTR_ERR_OR_ZERO(priv->cdev[pwm_port]->tcdev))
>>> +		return PTR_ERR(priv->cdev[pwm_port]->tcdev);
>>> +
>>> +	priv->cdev[pwm_port]->priv = priv;
>>> +	priv->cdev[pwm_port]->pwm_port = pwm_port;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>   static int aspeed_pwm_tacho_probe(struct platform_device *pdev)  {
>>>   	struct device *dev = &pdev->dev;
>>> -	struct device_node *np, *child;
>>> +	struct device_node *np, *child, *grandchild;
>>>   	struct aspeed_pwm_tacho_data *priv;
>>>   	void __iomem *regs;
>>>   	struct resource *res;
>>> @@ -833,10 +946,30 @@ static int aspeed_pwm_tacho_probe(struct
>> platform_device *pdev)
>>>   	aspeed_create_type(priv);
>>>
>>>   	for_each_child_of_node(np, child) {
>>> -		ret = aspeed_create_fan(dev, child, priv);
>>> +		if (!of_node_cmp(child->name, "tach-channels")) {
>>> +			for_each_child_of_node(child, grandchild) {
>>> +				ret = aspeed_create_fan(dev, grandchild,
>> priv);
>>> +				of_node_put(grandchild);
>>> +				if (ret) {
>>> +					of_node_put(child);
>>> +					return ret;
>>> +				}
>>> +			}
>>> +		}
>>> +
>>> +		if (!of_node_cmp(child->name, "pwm-channels")) {
>>> +			for_each_child_of_node(child, grandchild) {
>>> +				ret = aspeed_create_pwm_cooling(dev,
>>> +								grandchild,
>>> +								priv);
>>> +				of_node_put(grandchild);
>>> +				if (ret) {
>>> +					of_node_put(child);
>>> +					return ret;
>>> +				}
>>> +			}
>>> +		}
>>>   		of_node_put(child);
>>> -		if (ret)
>>> -			return ret;
>>>   	}
>>>
>>>   	priv->groups[0] = &pwm_dev_group;
>>> --
>>> 2.8.4
>>>
> 

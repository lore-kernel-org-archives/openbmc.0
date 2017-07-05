Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x2s8Y03trzDq5b
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jul 2017 05:57:00 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v65JrgJk138528
 for <openbmc@lists.ozlabs.org>; Wed, 5 Jul 2017 15:56:58 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bgv9tcumk-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 05 Jul 2017 15:56:57 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 5 Jul 2017 15:56:55 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 5 Jul 2017 15:56:54 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v65Jurfh56426638; Wed, 5 Jul 2017 19:56:53 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1667112047;
 Wed,  5 Jul 2017 15:56:53 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.83.0.237])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id D9017112040;
 Wed,  5 Jul 2017 15:56:51 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10] drivers/leds: Add GPIO keys for PCA955x
 and ast24/2500 gpio
To: Joel Stanley <joel@jms.id.au>
References: <20170630225521.7612-1-cbostic@linux.vnet.ibm.com>
 <CACPK8XeNz_paeutQF=ZjUURYWnWNHjWGr_Hb23C1S9tiqaRORg@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Wed, 5 Jul 2017 14:56:48 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XeNz_paeutQF=ZjUURYWnWNHjWGr_Hb23C1S9tiqaRORg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17070519-0048-0000-0000-000001BB96E5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007325; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00883329; UDB=6.00440654; IPR=6.00663520; 
 BA=6.00005454; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016095; XFM=3.00000015;
 UTC=2017-07-05 19:56:55
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17070519-0049-0000-0000-000041C6F329
Message-Id: <943d39f9-db00-5a97-e33f-9fca654a4949@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-05_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1707050331
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
X-List-Received-Date: Wed, 05 Jul 2017 19:57:01 -0000



On 7/3/17 12:40 AM, Joel Stanley wrote:
> On Sat, Jul 1, 2017 at 8:25 AM, Christopher Bostic
> <cbostic@linux.vnet.ibm.com> wrote:
>> Define gpio keys for power supply presence, ucd alert, and fan presence.
>>
>> Link pca955x to parent i2c interrupt controller so that new pca955x gpio
>> keys for fan presence haning off of pca955x can be defined.
>>
>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>> ---
>>   arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 77 ++++++++++++++++++++++++
>>   drivers/leds/leds-pca955x.c                      | 64 ++++++++++++++++++++
> The change to the source file and the .dts should be in separate patches.
Will separate them.
>
>>   2 files changed, 141 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> index 31315d0..24ea9944 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> @@ -46,6 +46,48 @@
>>                          gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
>>                          linux,code = <ASPEED_GPIO(J, 2)>;
>>                  };
>> +
>> +               ps0-presence {
>> +                       label = "ps0-presence";
>> +                       gpios = <&gpio ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
>> +                       linux,code = <ASPEED_GPIO(P, 7)>;
>> +               };
>> +
>> +               ps1-presence {
>> +                       label = "ps1-presence";
>> +                       gpios = <&gpio ASPEED_GPIO(N, 0) GPIO_ACTIVE_LOW>;
>> +                       linux,code = <ASPEED_GPIO(N, 0)>;
>> +               };
>> +
>> +               ucd-alert {
>> +                       label = "ucd-alert";
>> +                       gpios = <&gpio ASPEED_GPIO(I, 2) GPIO_ACTIVE_LOW>;
>> +                       linux,code = <ASPEED_GPIO(I, 2)>;
>> +               };
> I don't think this is correct. Isn't the alert line part of the sbmus device?
According to the Box Elder schematic revision 03232017 page 24 there is 
a line listed as 'BMC_UCD_ALERT_N' Connected to ast2500 GPIO I2 as an 
input.   It appears this net is also connected to the smbus device.   
Maybe I'm referencing the wrong signal?

>> +
>> +               fan0-presence {
>> +                       label = "fan0-presence";
>> +                       gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
>> +                       linux,code = <0>;
>> +               };
>> +
>> +               fan1-presence {
>> +                       label = "fan1-presence";
>> +                       gpios = <&pca0 1 GPIO_ACTIVE_LOW>;
>> +                       linux,code = <1>;
>> +               };
>> +
>> +               fan2-presence {
>> +                       label = "fan2-presence";
>> +                       gpios = <&pca0 2 GPIO_ACTIVE_LOW>;
>> +                       linux,code = <2>;
>> +               };
>> +
>> +               fan3-presence {
>> +                       label = "fan3-presence";
>> +                       gpios = <&pca0 3 GPIO_ACTIVE_LOW>;
>> +                       linux,code = <3>;
>> +               };
>>          };
>>
>>          leds {
>> @@ -203,6 +245,41 @@
>>                  compatible = "infineon,dps310";
>>                  reg = <0x76>;
>>          };
>> +
>> +       pca0: pca9552@60 {
>> +               compatible = "nxp,pca9552";
>> +               reg = <0x60>;
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +               gpio-controller;
>> +               #gpio-cells = <2>;
>> +
>> +               interrupt-parent = <&i2c_ic>;
>> +               interrupts = <3>;
>> +
>> +               gpio-line-names = "FAN0_PRESENSE_N", "FAN1_PRESENSE_N",
>> +                               "FAN2_PRESENSE_N", "FAN3_PRESENSE_N";
>> +
>> +               gpio@4 {
>> +                       reg = <4>;
>> +                       type = <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@5 {
>> +                       reg = <5>;
>> +                       type = <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@6 {
>> +                       reg = <6>;
>> +                       type = <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@7 {
>> +                       reg = <7>;
>> +                       type = <PCA955X_TYPE_GPIO>;
>> +               };
>> +       };
>>   };
>>
>>   &i2c4 {
>> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
>> index 9216742..88990f1 100644
>> --- a/drivers/leds/leds-pca955x.c
>> +++ b/drivers/leds/leds-pca955x.c
>> @@ -52,6 +52,7 @@
>>   #include <linux/of.h>
>>   #include <linux/slab.h>
>>   #include <linux/string.h>
>> +#include <linux/interrupt.h>
>>
>>   #include <dt-bindings/leds/leds-pca955x.h>
>>
>> @@ -389,6 +390,66 @@ static int pca955x_gpio_direction_output(struct gpio_chip *gc,
>>   }
>>   #endif
>>
>> +static void pca955x_irq_mask(struct irq_data *d)
>> +{
>> +}
>> +
>> +static void pca955x_irq_unmask(struct irq_data *d)
>> +{
>> +}
>> +
>> +static void pca955x_irq_bus_lock(struct irq_data *d)
>> +{
>> +}
>> +
>> +static void pca955x_irq_bus_sync_unlock(struct irq_data *d)
>> +{
>> +}
> It looks like you sent a half-finished version.
I added the basic capability required to register the GPIO key with 
interrupt support.   The intent was to use the 'generic' interrupt 
support provided by the kernel, handle_simple_irq( ) etc...   These 
functions were left undefined since its not clear what need there will 
be for them.  Maybe the best choice is to not define them in that case?


Thanks,
Chris
>> +
>> +static int pca955x_irq_set_type(struct irq_data *d, unsigned int type)
>> +{
>> +       return 0;
>> +}
>> +
>> +static struct irq_chip pca955x_irq_chip = {
>> +       .name                   = "pca955x",
>> +       .irq_mask               = pca955x_irq_mask,
>> +       .irq_unmask             = pca955x_irq_unmask,
>> +       .irq_bus_lock           = pca955x_irq_bus_lock,
>> +       .irq_bus_sync_unlock    = pca955x_irq_bus_sync_unlock,
>> +       .irq_set_type           = pca955x_irq_set_type,
>> +};
>> +
>> +static int pca955x_irq_setup(struct pca955x *chip, int irq_base)
>> +{
>> +       struct i2c_client *client;
>> +       int ret;
>> +
>> +       if (!chip)
>> +               return 0;
>> +
>> +       client = chip->client;
>> +       if (!client)
>> +               return 0;
>> +
>> +       if (client->irq && irq_base >= 0) {
>> +               ret = gpiochip_irqchip_add_nested(&chip->gpio,
>> +                                               &pca955x_irq_chip,
>> +                                               irq_base,
>> +                                               handle_simple_irq,
>> +                                               IRQ_TYPE_NONE);
>> +               if (ret) {
>> +                       dev_err(&client->dev,
>> +                               "could not connect irqchip to gpiochip\n");
>> +                       return ret;
>> +               }
>> +               gpiochip_set_nested_irqchip(&chip->gpio,
>> +                                       &pca955x_irq_chip,
>> +                                       client->irq);
>> +       }
>> +       return 0;
>> +}
>> +
>>   static int pca955x_probe(struct i2c_client *client,
>>                                          const struct i2c_device_id *id)
>>   {
>> @@ -543,6 +604,9 @@ static int pca955x_probe(struct i2c_client *client,
>>                  }
>>          }
>>   #endif
>> +       err = pca955x_irq_setup(pca955x, 0);
>> +       if (err)
>> +               return err;
>>
>>          return 0;
>>   }
>> --
>> 1.8.2.2
>>

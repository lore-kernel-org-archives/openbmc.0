Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xGhcp5r6KzDrCn
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 12:14:01 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6P2Dv60127647
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2017 22:13:59 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bwpb8q8up-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2017 22:13:57 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 24 Jul 2017 22:13:56 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 24 Jul 2017 22:13:54 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6P2DrJG2884090; Tue, 25 Jul 2017 02:13:53 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 294C5112047;
 Mon, 24 Jul 2017 22:13:49 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.83.3.94])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 84618112034;
 Mon, 24 Jul 2017 22:13:47 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 1/2] drivers/iio: dps310 Temperature
 measurement fix.
To: Joel Stanley <joel@jms.id.au>
References: <20170724212509.85197-1-cbostic@linux.vnet.ibm.com>
 <20170724212509.85197-2-cbostic@linux.vnet.ibm.com>
 <CACPK8XetDCZc7F=DzL_wg=jH_t-6Z=FDVb-0FkRz8x9k7oK2bQ@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Mon, 24 Jul 2017 21:13:49 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XetDCZc7F=DzL_wg=jH_t-6Z=FDVb-0FkRz8x9k7oK2bQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17072502-0008-0000-0000-000002643044
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007420; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00892462; UDB=6.00446076; IPR=6.00672626; 
 BA=6.00005489; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016360; XFM=3.00000015;
 UTC=2017-07-25 02:13:55
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17072502-0009-0000-0000-00003624F8AD
Message-Id: <2c910588-4081-a9ad-4adb-b4fd883abdd9@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-25_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707250035
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
X-List-Received-Date: Tue, 25 Jul 2017 02:14:03 -0000



On 7/24/17 8:41 PM, Joel Stanley wrote:
> On Tue, Jul 25, 2017 at 6:55 AM, Christopher Bostic
> <cbostic@linux.vnet.ibm.com> wrote:
>> Add a manufacturer's suggested workaround to deal with early revisions
>> of chip that don't indicate correct temperature.  Readings can be in the
>> ~60C range when they should be in the ~20's.
>>
>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> Looks okay Chris. Has there been an errata issued for the device so I
> can check what we're doing here?

I wasn't able to find any official documentation from the manufacturer 
on this.  This is based on existing FSP workarounds for this device.

Thanks,
Chris
>
> I don't think there's much value in the #defines without meaningful
> labels, so I removed them when applying the patch.
>
> Cheers,
>
> Joel
>
>> ---
>>   drivers/iio/pressure/dps310.c | 49 ++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 48 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
>> index 1b54ae0..f351c26 100644
>> --- a/drivers/iio/pressure/dps310.c
>> +++ b/drivers/iio/pressure/dps310.c
>> @@ -56,7 +56,12 @@
>>   #define  DPS310_FIFO_EN                BIT(5)
>>   #define  DPS310_SPI_EN         BIT(6)
>>   #define DPS310_RESET           0x0c
>> +#define DPS310_TEMP_FIX_E      0x0e
>> +#define DPS310_TEMP_FIX_F      0x0f
>>   #define  DPS310_RESET_MAGIC    (BIT(0) | BIT(3))
>> +#define DPS310_TEMP_FIX_32     0x32
>> +#define  DPS310_TEMP_ERR_FIXED BIT(1)
>> +#define DPS310_TEMP_FIX_62     0x62
>>   #define DPS310_COEF_BASE       0x10
>>
>>   #define DPS310_PRS_BASE                DPS310_PRS_B0
>> @@ -219,6 +224,9 @@ static bool dps310_is_writeable_reg(struct device *dev, unsigned int reg)
>>          case DPS310_MEAS_CFG:
>>          case DPS310_CFG_REG:
>>          case DPS310_RESET:
>> +       case DPS310_TEMP_FIX_E:
>> +       case DPS310_TEMP_FIX_F:
>> +       case DPS310_TEMP_FIX_62:
>>                  return true;
>>          default:
>>                  return false;
>> @@ -308,7 +316,7 @@ static int dps310_read_raw(struct iio_dev *iio,
>>          .writeable_reg = dps310_is_writeable_reg,
>>          .volatile_reg = dps310_is_volatile_reg,
>>          .cache_type = REGCACHE_RBTREE,
>> -       .max_register = 0x29,
>> +       .max_register = 0x62,
>>   };
>>
>>   static const struct iio_info dps310_info = {
>> @@ -317,6 +325,41 @@ static int dps310_read_raw(struct iio_dev *iio,
>>          .write_raw = dps310_write_raw,
>>   };
>>
>> +/*
>> + * Some verions of chip will read temperatures in the ~60C range when
>> + * its acutally ~20C. This is the manufacturer recommended workaround
>> + * to correct the issue.
>> + */
>> +static int dps310_temp_workaround(struct dps310_data *data)
>> +{
>> +       int r, reg;
>> +
>> +       r = regmap_read(data->regmap, DPS310_TEMP_FIX_32, &reg);
>> +       if (r < 0)
>> +               return r;
>> +
>> +       if (!(reg & DPS310_TEMP_ERR_FIXED)) {
>> +               r = regmap_write(data->regmap, DPS310_TEMP_FIX_E, 0xA5);
>> +               if (r < 0)
>> +                       return r;
>> +
>> +               r = regmap_write(data->regmap, DPS310_TEMP_FIX_F, 0x96);
>> +               if (r < 0)
>> +                       return r;
>> +
>> +               r = regmap_write(data->regmap, DPS310_TEMP_FIX_62, 0x02);
>> +               if (r < 0)
>> +                       return r;
>> +
>> +               r = regmap_write(data->regmap, DPS310_TEMP_FIX_E, 0x00);
>> +               if (r < 0)
>> +                       return r;
>> +
>> +               r = regmap_write(data->regmap, DPS310_TEMP_FIX_F, 0x00);
>> +       }
>> +       return r;
>> +}
>> +
>>   static int dps310_probe(struct i2c_client *client,
>>                          const struct i2c_device_id *id)
>>   {
>> @@ -379,6 +422,10 @@ static int dps310_probe(struct i2c_client *client,
>>          if (r < 0)
>>                  return r;
>>
>> +       r = dps310_temp_workaround(data);
>> +       if (r < 0)
>> +               return r;
>> +
>>          r = devm_iio_device_register(&client->dev, iio);
>>          if (r)
>>                  return r;
>> --
>> 1.8.2.2
>>

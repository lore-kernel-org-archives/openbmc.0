Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vfD6R5BmbzDq5x
 for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2017 01:58:23 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v29EhnoY039687
 for <openbmc@lists.ozlabs.org>; Thu, 9 Mar 2017 09:58:10 -0500
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2932yxtrgf-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 09 Mar 2017 09:58:10 -0500
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 9 Mar 2017 09:58:09 -0500
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 9 Mar 2017 09:58:08 -0500
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v29Ew71i41418760; Thu, 9 Mar 2017 14:58:07 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A30FAC048;
 Thu,  9 Mar 2017 09:58:02 -0500 (EST)
Received: from Christophers-MacBook-Pro.local (unknown [9.81.214.151])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 96DA1AC040;
 Thu,  9 Mar 2017 09:58:00 -0500 (EST)
Subject: Re: [PATCH linux dev-4.7] drivers/fsi: Flag FSI bus errors with
 dev_err( )
To: Joel Stanley <joel@jms.id.au>
References: <20170309000213.20262-1-cbostic@linux.vnet.ibm.com>
 <CACPK8XeqJ47Sj+X1ZpPKRUBFrmwaZzT1YDNwUBHRvxzZcAXQOg@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Thu, 9 Mar 2017 08:58:03 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XeqJ47Sj+X1ZpPKRUBFrmwaZzT1YDNwUBHRvxzZcAXQOg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17030914-0036-0000-0000-0000019C0272
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006751; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00832212; UDB=6.00408388; IPR=6.00609799; 
 BA=6.00005202; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014575; XFM=3.00000013;
 UTC=2017-03-09 14:58:09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17030914-0037-0000-0000-00003EB957D1
Message-Id: <3cc9d8a3-5595-9f37-ce2c-6354dcbb1300@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-09_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703090111
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
X-List-Received-Date: Thu, 09 Mar 2017 14:58:24 -0000



On 3/9/17 4:51 AM, Joel Stanley wrote:
> On Thu, Mar 9, 2017 at 10:32 AM, Christopher Bostic
> <cbostic@linux.vnet.ibm.com> wrote:
>> Currently not seeing details of any FSI bus errors that may
>> occur.  Send info via dev_err so that the type of FSI bus fail
>> can be determined.
> Are these really errors for normal users of the system?
>
> I think these will only be useful for FSI developers. Use the dynamic
> debug system for having developer errors.
Hi Joel,

On second thought I think the dynamic debug facilities will be enough.   
This change will generate more spam to console for benign bus errors 
during the normal scan process.   I'll cancel submission.

Thanks
-Chris

>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>> ---
>>   drivers/fsi/fsi-master-gpio.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
>> index 49f3399..c2f2fe2 100644
>> --- a/drivers/fsi/fsi-master-gpio.c
>> +++ b/drivers/fsi/fsi-master-gpio.c
>> @@ -218,8 +218,8 @@ static int poll_for_response(struct fsi_master_gpio *master, uint8_t expected,
>>                                  break;
>>                  }
>>                  if (i >= FSI_GPIO_MTOE_COUNT) {
>> -                       dev_dbg(master->master.dev,
>> -                               "Master time out waiting for response\n");
>> +                       dev_err(master->master.dev,
>> +                               "MTOE: Master time out waiting for response\n");
>>                          drain_response(master);
>>                          fsi_master_gpio_error(master, FSI_GPIO_MTOE);
>>                          return -EIO;
>> @@ -257,8 +257,8 @@ static int poll_for_response(struct fsi_master_gpio *master, uint8_t expected,
>>
>>                  case FSI_GPIO_RESP_ERRA:
>>                  case FSI_GPIO_RESP_ERRC:
>> -                       dev_dbg(master->master.dev, "ERR received: %d\n",
>> -                               (int)response.msg);
>> +                       dev_err(master->master.dev, "ERRA/C received: %d\n",
>> +                               response_id);
>>                          /*
>>                           * todo: Verify crc from slave and in general
>>                           * only act on any response if crc is correct
>> @@ -283,7 +283,7 @@ static int poll_for_response(struct fsi_master_gpio *master, uint8_t expected,
>>                  /* Read in the crc and check it */
>>                  serial_in(master, &response, FSI_GPIO_CRC_SIZE);
>>                  if (crc_in != response.msg) {
>> -                       dev_dbg(master->master.dev, "ERR response CRC\n");
>> +                       dev_err(master->master.dev, "ERR response CRC\n");
>>                          fsi_master_gpio_error(master, FSI_GPIO_CRC_INVAL);
>>                          return -EIO;
>>                  }
>> @@ -293,7 +293,7 @@ static int poll_for_response(struct fsi_master_gpio *master, uint8_t expected,
>>
>>          } while (busy_count++ < FSI_GPIO_MAX_BUSY);
>>
>> -       dev_dbg(master->master.dev, "ERR slave is stuck in busy state\n");
>> +       dev_err(master->master.dev, "ERR slave is stuck in busy state\n");
>>          fsi_master_gpio_error(master, FSI_GPIO_ERR_BUSY);
>>
>>          return -EIO;
>> --
>> 1.8.2.2
>>

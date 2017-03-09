Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vfC3C60BvzDqXj
 for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2017 01:10:31 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v29E8i6D097980
 for <openbmc@lists.ozlabs.org>; Thu, 9 Mar 2017 09:10:22 -0500
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2937e5kt4j-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 09 Mar 2017 09:10:22 -0500
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 9 Mar 2017 09:10:20 -0500
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 9 Mar 2017 09:10:17 -0500
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v29EAG0711665798; Thu, 9 Mar 2017 07:10:16 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C51BBE044;
 Thu,  9 Mar 2017 07:10:16 -0700 (MST)
Received: from Christophers-MacBook-Pro.local (unknown [9.81.214.151])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 66055BE038;
 Thu,  9 Mar 2017 07:10:14 -0700 (MST)
Subject: Re: [PATCH linux dev-4.7] drivers/fsi: Flag FSI bus errors with
 dev_err( )
To: Joel Stanley <joel@jms.id.au>
References: <20170309000213.20262-1-cbostic@linux.vnet.ibm.com>
 <CACPK8XeqJ47Sj+X1ZpPKRUBFrmwaZzT1YDNwUBHRvxzZcAXQOg@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Thu, 9 Mar 2017 08:10:12 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XeqJ47Sj+X1ZpPKRUBFrmwaZzT1YDNwUBHRvxzZcAXQOg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17030914-0044-0000-0000-000002C3BF28
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006751; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00832196; UDB=6.00408379; IPR=6.00609784; 
 BA=6.00005202; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014575; XFM=3.00000013;
 UTC=2017-03-09 14:10:19
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17030914-0045-0000-0000-000006F1CF09
Message-Id: <f0dfac2b-dd3f-edbb-0fa9-41b8517866f9@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-09_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703090107
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
X-List-Received-Date: Thu, 09 Mar 2017 14:10:32 -0000



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

I suppose there are two different situations where this error info would 
be useful.  First during developer debug and bringup which would sound 
more like a candidate for the dynamic debug system you mention.  Second 
case is after all firmware bugs have been ironed out and we have general 
system errors related to hardware fails. Is that a developer error or 
info for users.  To me that would be more for normal users of the system.

Thanks
-Chris.

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

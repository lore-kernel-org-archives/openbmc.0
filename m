Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40lFh81V3RzF3cv
 for <openbmc@lists.ozlabs.org>; Tue, 15 May 2018 08:27:51 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4EMNoSI051515
 for <openbmc@lists.ozlabs.org>; Mon, 14 May 2018 18:27:49 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2hydkn5c89-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 14 May 2018 18:27:49 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 14 May 2018 16:27:48 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 14 May 2018 16:27:45 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w4EMRjU213041936; Mon, 14 May 2018 15:27:45 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6297E78037;
 Mon, 14 May 2018 16:27:45 -0600 (MDT)
Received: from [9.85.141.234] (unknown [9.85.141.234])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id BBF1D78041;
 Mon, 14 May 2018 16:27:44 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.13 0/2] Fix SBEFIFO chardev read behaviour
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
References: <20180514061809.11487-1-andrew@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 14 May 2018 17:27:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180514061809.11487-1-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18051422-0016-0000-0000-000008B8FBA4
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009026; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000260; SDB=6.01032362; UDB=6.00527771; IPR=6.00811493; 
 MB=3.00021114; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-14 22:27:47
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18051422-0017-0000-0000-00003EB85752
Message-Id: <b73439a1-ea2e-0352-d7b1-440bdf2243f6@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-14_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805140221
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 14 May 2018 22:27:52 -0000



On 05/14/2018 01:18 AM, Andrew Jeffery wrote:
> Hello,
>
> read() on the SBEFIFO chardevs is currently unusuable as it will always return
> -EAGAIN on a read subsequent to the EOT flag being observed. This breaks reads
> using short buffers as we now have no way to know when we have received the
> entire message. This is made infinitely worse by the protocol, which as
> defined, means we cannot know how much data must be read, and therefore all
> buffers are effectively short*.
>
> These two patches help by at least returning 0 for a read subsequent to one
> which drains the last byte from the transfer buffer. A read subsequent to one
> returning 0 will then return -EAGAIN if necessary, under the expectation that a
> write() has been issued.

Thanks Andrew, I haven't dug into the diffs too much but I just tested 
the series and it appears to have made the in-kernel API less reliable. 
I'm getting some errors when attempting to use the OCC driver.

Thanks,
Eddie

>
> This is a work-around until BenH gets his alternative SBEFIFO implementation in
> shape.
>
> * This is true to a point - it recently came to light that we can expect any
>    FFDC to be at a maximum 8K in size, and the maximum size of the transfer is
>    defined as:
>
>    * The requested response size, plus
>    * The status "header", plus
>    * Up to 8K of FFDC
>
> Andrew Jeffery (2):
>    fsi: sbefifo: Unpack !sbefifo_xfr_rsp_pending(client) test
>    fsi: sbefifo: Return 0 on read() to indicate end of response
>
>   drivers/fsi/fsi-sbefifo.c | 48 +++++++++++++++++++++++++++++++--------
>   1 file changed, 38 insertions(+), 10 deletions(-)
>

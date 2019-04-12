Return-Path: <anoo@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44gj7h1wM5zDqSv
 for <openbmc@lists.ozlabs.org>; Sat, 13 Apr 2019 01:51:59 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3CFpNVh140182
 for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2019 11:51:56 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rtvgm3f6j-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2019 11:51:54 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Fri, 12 Apr 2019 16:51:44 +0100
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 12 Apr 2019 16:51:43 +0100
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3CFpfec27852874
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Apr 2019 15:51:41 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95FFC7805C;
 Fri, 12 Apr 2019 15:51:41 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73D9C7805F;
 Fri, 12 Apr 2019 15:51:41 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 12 Apr 2019 15:51:41 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 12 Apr 2019 10:52:49 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Eddie James <eajames@linux.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: USB Gadget Vendor ID
In-Reply-To: <fdb92e78-6cdf-04e3-9b4f-6ca3d36b73e8@linux.ibm.com>
References: <213010e1dd547165f8f56ee672c832fa@linux.vnet.ibm.com>
 <fdb92e78-6cdf-04e3-9b4f-6ca3d36b73e8@linux.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19041215-0004-0000-0000-000014FBF423
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010914; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000284; SDB=6.01188069; UDB=6.00622371; IPR=6.00968837; 
 MB=3.00026411; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-12 15:51:43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19041215-0005-0000-0000-00008B3C0018
Message-Id: <3d670716e684620dfcce63d0f5d50ad1@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-12_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=877 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904120105
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Apr 2019 15:52:00 -0000

On 2019-04-12 10:24, Eddie James wrote:
> On 4/12/19 10:17 AM, Adriana Kobylak wrote:
>> Hi Eddie,
>> 
>> I have a script to initialize the USB gadget for Virtual Media and 
>> there was a comment that the Vendor ID should be provided by the Linux 
>> Foundation - 
>> https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/17494 .
>> 
>> In your ikvm script you use a Vendor ID with the comment "Linux 
>> Foundation" - 
>> https://github.com/openbmc/obmc-ikvm/blob/fb6a8e1e727a8ece5eb0350d3962dd3056a6f608/create_usbhid.sh#L18
>> 
>> Is this an ID that came from the LF, and if so could I use it in my 
>> script?
> 
> 
> Hi,
> 
> Since OpenBMC is a LF project, I just used their vendor ID... and I
> just invented a serial number. This might not be the proper way to do
> it... Since the devices are virtual, I'm not sure anyone will care
> though?
> 
> 
Thanks that helps. Forgot to ask about the the product id (echo 0x0104 > 
idProduct # Multifunction Composite Gadget), is it also a LF number or 
documented somewhere?

>> 
>> As a side question, were there any discussions about the serial number 
>> value in the ikvm script? I have a similar hard-coded value for the 
>> virtual media one but there were questions in the review about how 
>> useful could it be having a non-generated value and to have it removed 
>> instead.
> 
> 
> I think there were similar comments about the serial number but in the
> end it was decided to worry about it later I think.
> 
> Thanks, Eddie

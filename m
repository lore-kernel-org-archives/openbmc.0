Return-Path: <hegdevasant@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hegdevasant@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 404QjN4jvjzF1ct
 for <openbmc@lists.ozlabs.org>; Mon, 19 Mar 2018 17:13:11 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2J69HF5047754
 for <openbmc@lists.ozlabs.org>; Mon, 19 Mar 2018 02:13:09 -0400
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2gt1qfhyw4-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 19 Mar 2018 02:13:08 -0400
Received: from localhost
 by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <hegdevasant@linux.vnet.ibm.com>;
 Mon, 19 Mar 2018 06:13:05 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 19 Mar 2018 06:13:04 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2J6D3JH55771206; Mon, 19 Mar 2018 06:13:03 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 584D842054;
 Mon, 19 Mar 2018 06:05:13 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE3994203F;
 Mon, 19 Mar 2018 06:05:11 +0000 (GMT)
Received: from [9.109.198.195] (unknown [9.109.198.195])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 19 Mar 2018 06:05:11 +0000 (GMT)
Subject: Re: Parse PELs sent by OpenPOWER host firmware
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, geissonator@gmail.com,
 anoo@linux.vnet.ibm.com, stewart@linux.vnet.ibm.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <2815fac8-3a1f-d2ed-3c3d-ca7072de9db2@linux.vnet.ibm.com>
From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Date: Mon, 19 Mar 2018 11:43:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <2815fac8-3a1f-d2ed-3c3d-ca7072de9db2@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18031906-0016-0000-0000-00000534A97C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18031906-0017-0000-0000-00002871BF31
Message-Id: <57a7cfab-2338-552a-1482-88b5bc68a7b4@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-19_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803190079
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
X-List-Received-Date: Mon, 19 Mar 2018 06:13:13 -0000

On 03/13/2018 07:09 PM, Deepak Kodihalli wrote:
> Hi,
> 
> The SELs/eSELs (System Event Log) that OpenBMC receives from hostboot/skiboot 
> today are not interpreted, and are dumped as-is in a property of the error log 
> D-Bus object. This means that if there's a PEL (Platform Event Log) hidden in 
> the eSEL, admins/users of the error log need to depend on external tools to 
> parse the PEL to human readable text.

Yes.  We are having hard time with this. Any improvement is welcome.


> 
> Here's a proposal to have the BMC itself parse such eSELs (the motivation is to 
> make the OpenBMC error logs more useful in this context, without needing the 
> extra steps to parse such errors) :
> 
> - Separate this from phosphor-logging. This code can't go to a phosphor app, 
> because it's OpenPOWER specific. Have, for example, an openpower-logging app 
> implement a D-Bus interface to parse out a PEL from an eSEL. This app will host 
> it's own D-Bus service.
> 
> - Such an app can watch for error D-Bus objects being created in the phosphor 
> namespace. If it finds an eSEL in an error log, it can attempt to parse a PEL 
> (if there's one), and store the PELs parsed text representation in a D-Bus 
> property.
> 
> - The app can create a D-Bus object with the same path as the original object 
> and have a D-Bus object-manager at the error log root path, so that when someone 
> uses the OpenBMC REST API to read an error log, properties across all D-Bus 
> services will be returned (phosphor-rest-server does this today already). This 
> means with the existing REST API to enumerate error logs, a parsed PEL would be 
> returned, if present.
> 
> - To parse the PEL, use opal-elog-parse.

+1. I think it has capability to detect eSEL wrapper as well. It should just 
work fine.

-Vasant

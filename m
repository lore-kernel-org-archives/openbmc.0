Return-Path: <dkodihal@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41gXcT4lrKzF10S
 for <openbmc@lists.ozlabs.org>; Wed,  1 Aug 2018 22:27:05 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w71B5nY1013064
 for <openbmc@lists.ozlabs.org>; Wed, 1 Aug 2018 07:08:03 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2kkbpeg415-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 01 Aug 2018 07:08:03 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Wed, 1 Aug 2018 12:08:01 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 Aug 2018 12:07:58 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w71B7vq236372488
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 1 Aug 2018 11:07:57 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BB48A405F;
 Wed,  1 Aug 2018 14:08:08 +0100 (BST)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9513FA405D;
 Wed,  1 Aug 2018 14:08:07 +0100 (BST)
Received: from Deepaks-MacBook-Pro.local (unknown [9.199.202.110])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 Aug 2018 14:08:07 +0100 (BST)
Subject: Re: SSL Certificate management proposal.
To: Ed Tanous <ed.tanous@intel.com>, ojayanth@gmail.com
References: <CACkAXSrxyf819dQc+LEOfwahpcrK2QRH1AkXump-D9Ae+yaKBQ@mail.gmail.com>
 <1d63a4ec-1902-c9d3-13d8-94ef7e437425@intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Wed, 1 Aug 2018 16:37:56 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1d63a4ec-1902-c9d3-13d8-94ef7e437425@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18080111-0016-0000-0000-000001EF4D95
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18080111-0017-0000-0000-0000324473A0
Message-Id: <833122ce-4fa0-540d-908a-65a7281177dc@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-01_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1806210000 definitions=main-1808010117
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2018 12:27:06 -0000

On 31/07/18 11:21 PM, Ed Tanous wrote:
> On 07/31/2018 07:49 AM, Jayanth Othayoth wrote:
>>
>> The workflow for updating a signed certificate on the BMC consists of:
>> 1. Generating a CSR on the BMC
>> 2. Exporting the CSR from the BMC onto the user’s storage device
>> 3. Obtaining a singed certificate corresponding to the CSR from a CA
>> 4. Importing the signed certificate on the BMC
>>
> 
> This workflow is somewhat of a non starter for a lot of organizations 
> and IT departments.  First, it requires that every BMC have its own 
> private key, which isn't always desired.
> Second, it means that you either have to be able to specify all 
> parameters that a user would want to specify about his key (number of 
> bits, EC vs RSA, ect).
> Third, it requires that every BMC be provisioned by the intermediate 
> authority, which can be difficult if keys either have a cost associated 
> with them, or are difficult to acquire.
> 
> I would vote that we should start with the key and certificate upload 
> flows, as they are far simpler to implement, and better understood in 
> practice then try to go after the BMC CSR implementation if it's still 
> required.

We might have to do both (the CSR option if customers prefer the the 
private key never leaves the BMC), but agree with starting with a simple 
certificate and key upload approach. I wanted to discuss the following 
high-level design for the same :

1) OpenBMC Rest/Redfish API to upload certificate and private key, and 
also specify target protocol (see point 2). Synchronous API that lets 
caller know if the upload and installation was successful.
2) Have a json config that lets you know certificate install location 
based on different protocols (these would still be SSL/TLS certificates, 
but based on the protocol, say https or ldap) and/or web-servers being 
used, the certificate may have to be installed at different locations on 
the BMC flash.
3) Rest server copies the certificate to a common location and invokes 
an app via (internal) D-Bus api for certificate activation (lets app 
know the certificate path and the protocol type). The app consumes the 
config from 2).
4) The certificate "activation" would essentially be validating the 
certificate content (via openssl api) and then restarting specific 
systemd units. The app from 3) would perform this, and let the rest 
server know about the status. The app could again be configured based on 
the protocol and the web-server, to determine what service to restart 
(for eg restart nginx).

Regards,
Deepak

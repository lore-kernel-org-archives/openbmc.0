Return-Path: <prvs=0626c72fa9=dkodihal@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=prvs=0626c72fa9=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40BlrM4kYSzDqZH
 for <openbmc@lists.ozlabs.org>; Fri, 30 Mar 2018 00:26:08 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2TDKEaw044939
 for <openbmc@lists.ozlabs.org>; Thu, 29 Mar 2018 09:26:05 -0400
Received: from e06smtp11.uk.ibm.com (e06smtp11.uk.ibm.com [195.75.94.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2h1030tt34-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 29 Mar 2018 09:26:04 -0400
Received: from localhost
 by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Thu, 29 Mar 2018 14:26:02 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp11.uk.ibm.com (192.168.101.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 29 Mar 2018 14:26:02 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2TDQ1SJ44236908; Thu, 29 Mar 2018 13:26:01 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64000A4051;
 Thu, 29 Mar 2018 14:18:36 +0100 (BST)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E66AFA4057;
 Thu, 29 Mar 2018 14:18:35 +0100 (BST)
Received: from Deepaks-MacBook-Pro.local (unknown [9.199.202.245])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 29 Mar 2018 14:18:35 +0100 (BST)
Subject: Re: Attention users of network IPMI
To: tomjose@linux.vnet.ibm.com
References: <d58f47d2-310c-f6cb-1ef0-6f7cae9bf7c0@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Thu, 29 Mar 2018 18:56:00 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:52.0)
 Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <d58f47d2-310c-f6cb-1ef0-6f7cae9bf7c0@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18032913-0040-0000-0000-00000446C026
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18032913-0041-0000-0000-000020EAD4BC
Message-Id: <4333c25f-d5bb-e4b8-f6c4-62deb53362a1@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-29_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803290143
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
X-List-Received-Date: Thu, 29 Mar 2018 13:26:12 -0000

On 29/03/18 2:53 pm, Tom Joseph wrote:
> Hello,
> 
> Based on  feedback from the team writing management scripts for OpenBMC. 
> There is a suggestion to
> support the "-U" parameter when running the IPMI over network, to keep 
> the script consistent across
> multiple BMC implementations.
> 
> The support currently in  OpenBMC for the IPMI user accounts is the 
> nameless account and the -U option
> is not needed and only the -P option is needed. With the proposed 
> change, "-U admin" is needed, for the

This would break current users based on a nameless account. So I suppose 
that you'd have to still support a nameless account.

> session setup to succeed. "root"  username was not preferred so that the 
> user does not get confused with the
> linux user account.
> 
> IPMITool usage with the proposed change:
> 
> ipmitool -I lanplus -H x.x.x.x -U admin -P 0penBmc <cmd>
> 
> https://gerrit.openbmc-project.xyz/#/c/9643/
> 
> Regards,
> 
> Tom
> 

Regards,
Deepak

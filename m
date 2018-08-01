Return-Path: <stewart@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41gKdV50zszF10S
 for <openbmc@lists.ozlabs.org>; Wed,  1 Aug 2018 14:12:14 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7148c35031918
 for <openbmc@lists.ozlabs.org>; Wed, 1 Aug 2018 00:12:11 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2kk5ggg7mb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 01 Aug 2018 00:12:11 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Wed, 1 Aug 2018 00:12:10 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 Aug 2018 00:12:08 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w714C7OZ14942630
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 1 Aug 2018 04:12:07 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 100C328058;
 Wed,  1 Aug 2018 00:11:05 -0400 (EDT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C30FD28059;
 Wed,  1 Aug 2018 00:11:04 -0400 (EDT)
Received: from birb.localdomain (unknown [9.185.142.68])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  1 Aug 2018 00:11:04 -0400 (EDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id B4B734EC629; Wed,  1 Aug 2018 14:12:05 +1000 (AEST)
From: Stewart Smith <stewart@linux.ibm.com>
To: Jeremy Kerr <jk@ozlabs.org>, Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Virtual Media
In-Reply-To: <e1b784dc-3434-cfda-a07b-3a065458fef0@ozlabs.org>
References: <69abb9a05c7d01b71cd4a69f3e7c548e@linux.vnet.ibm.com>
 <eb74222a-737f-92cb-66a3-8d023b5962dc@ozlabs.org>
 <20180731180257.GJ105329@mauery>
 <e1b784dc-3434-cfda-a07b-3a065458fef0@ozlabs.org>
Date: Wed, 01 Aug 2018 14:12:05 +1000
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18080104-0068-0000-0000-00000320EC7D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009465; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01068688; UDB=6.00549422; IPR=6.00846950; 
 MB=3.00022432; MTD=3.00000008; XFM=3.00000015; UTC=2018-08-01 04:12:09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18080104-0069-0000-0000-0000453AC5B2
Message-Id: <87wotag1yi.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-01_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=942 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1806210000 definitions=main-1808010044
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
X-List-Received-Date: Wed, 01 Aug 2018 04:12:15 -0000

Jeremy Kerr <jk@ozlabs.org> writes:
>> RO files should really be the biggest use case for this -- host OS 
>> installs and such. I really don't know how much people will complain if 
>> we take their RW files away.
>
> Yes, I'd agree there. As above, I'm not sure how much this would be
> used. The one use-case I can imagine is a small writeable filesystem for
> saving debug logs (in our case, from petitboot). However, we also have
> actual host network available at that point...

zmodem over the terminal right to the browser!

(only slightly not joking)

-- 
Stewart Smith
OPAL Architect, IBM.

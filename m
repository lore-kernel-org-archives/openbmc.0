Return-Path: <msbarth@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=msbarth@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44F3sV3VTQzDqGx
 for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2019 06:36:10 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x26JXuuh141322
 for <openbmc@lists.ozlabs.org>; Wed, 6 Mar 2019 14:36:08 -0500
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2r2k6j3xws-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 06 Mar 2019 14:36:08 -0500
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <msbarth@linux.ibm.com>;
 Wed, 6 Mar 2019 19:36:07 -0000
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 6 Mar 2019 19:36:03 -0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x26Ja22L21823712
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Mar 2019 19:36:02 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF08FAC05B;
 Wed,  6 Mar 2019 19:36:02 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A263AC05F;
 Wed,  6 Mar 2019 19:36:02 +0000 (GMT)
Received: from [9.10.99.133] (unknown [9.10.99.133])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  6 Mar 2019 19:36:02 +0000 (GMT)
To: Patrick Venture <venture@google.com>,
 James Feist <james.feist@linux.intel.com>
Cc: Aaron Williams <awilliams@marvell.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Matthew Barth <msbarth@linux.ibm.com>
Subject: PID control configuration usage
Date: Wed, 6 Mar 2019 13:36:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19030619-2213-0000-0000-0000035F2840
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010716; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01170565; UDB=6.00611785; IPR=6.00951205; 
 MB=3.00025861; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-06 19:36:05
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19030619-2214-0000-0000-00005D95D8A2
Message-Id: <39398601-6181-ac24-991c-528e0b0f70f2@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-06_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=767 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903060134
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
X-List-Received-Date: Wed, 06 Mar 2019 19:36:15 -0000

I'm investigating the functionality and use of pid-control to what is 
currently being used on IBM's witherspoon system. Is there a PID control 
configuration being used that's upstream? I am unable to find any 
systems in the meta layers using pid-control that provides a direct 
configuration example. It looks to be used in the Intel layer that pulls 
a config together from entity-manager and presents it on dbus to 
pid-control, but I dont follow how the entity-manager json transforms to 
the consumable pid-control json. Could someone point me to a functional 
(possibly in-use) example or show the json config produced from 
entity-manager?

Thanks,
Matt

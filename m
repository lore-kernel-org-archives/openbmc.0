Return-Path: <gmills@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gmills@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43wSwy3jqlzDq6c
 for <openbmc@lists.ozlabs.org>; Fri,  8 Feb 2019 06:26:38 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x17JM2Pw009883
 for <openbmc@lists.ozlabs.org>; Thu, 7 Feb 2019 14:26:36 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2qgt4btgk7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 07 Feb 2019 14:26:36 -0500
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gmills@linux.vnet.ibm.com>;
 Thu, 7 Feb 2019 19:26:35 -0000
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 7 Feb 2019 19:26:32 -0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x17JQVrq24314098
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Feb 2019 19:26:31 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C474B206B;
 Thu,  7 Feb 2019 19:26:31 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 625DBB206A;
 Thu,  7 Feb 2019 19:26:31 +0000 (GMT)
Received: from [9.10.100.31] (unknown [9.10.100.31])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  7 Feb 2019 19:26:31 +0000 (GMT)
From: GUNNAR MILLS <gmills@linux.vnet.ibm.com>
Subject: Using Stale bot to clean up issues
To: bradleyb@fuzziesquirrel.com, openbmc@lists.ozlabs.org
Date: Thu, 7 Feb 2019 13:26:31 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19020719-0060-0000-0000-0000030783D9
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010555; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000279; SDB=6.01157727; UDB=6.00604020; IPR=6.00938258; 
 MB=3.00025481; MTD=3.00000008; XFM=3.00000015; UTC=2019-02-07 19:26:33
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19020719-0061-0000-0000-00004837AADC
Message-Id: <01b53196-6c78-b004-8cd0-8534c516cbaf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-07_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=902 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902070144
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
X-List-Received-Date: Thu, 07 Feb 2019 19:26:43 -0000

 From some discussion on IRC.
We have a lot of old issues (primary in openbmc/openbmc).
I came across Stale bot, https://github.com/apps/stale
An example of the bot in action: 
https://github.com/boostorg/beast/issues/1235

Is anyone opposed to using this bot to help clean up our issues?

I was thinking we could start pretty lax,  6 months of inactivity to 
mark stale and 1 month of inactivity before a stale issue is closed.
Would like to see this enabled on all our repos, but could start with 
openbmc/openbmc.

If no one is opposed, Brad could you install this bot?

Thanks!
Gunnar

Return-Path: <mspinler@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44qld253v8zDqdD
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 04:11:49 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3PI8t0H067628
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 14:11:46 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s3fcf6qx3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 14:11:46 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.ibm.com>;
 Thu, 25 Apr 2019 19:11:45 +0100
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 25 Apr 2019 19:11:43 +0100
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3PIBgo24850020
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 18:11:42 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FF436A04D
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 18:11:42 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E6F26A047
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 18:11:42 +0000 (GMT)
Received: from [9.10.99.36] (unknown [9.10.99.36])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 18:11:42 +0000 (GMT)
From: Matt Spinler <mspinler@linux.ibm.com>
Subject: phosphor-logging plugins vs new daemons
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Thu, 25 Apr 2019 13:11:44 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19042518-0004-0000-0000-00001503F846
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010994; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01194278; UDB=6.00626136; IPR=6.00975107; 
 MB=3.00026596; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-25 18:11:44
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19042518-0005-0000-0000-00008B672EDB
Message-Id: <f3aae448-3f19-ddff-af67-1c2f85b38a6f@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-25_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=973 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904250112
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
X-List-Received-Date: Thu, 25 Apr 2019 18:11:51 -0000

Hi,

We have some work coming up where we need to create different formats of
error logs based on the phosphor logging error log items that are created.
We can accomplish this by either creating a separate daemon that listens
for D-Bus signals for new log entries, or we come up with a plugin
architecture for phosphor-log-manager where we let libs register functions
in certain points, like before/after a log is created/deleted.

At this point we are leaning toward the plugin route, as apparently
there was some discussion at the last OCP that recommended this.

I'm just wondering if anyone has any leanings either way, or any other
ideas before we start on a design document?

Thanks!
Matt

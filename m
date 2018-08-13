Return-Path: <anoo@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41q42C1zm7zF0Vv
 for <openbmc@lists.ozlabs.org>; Tue, 14 Aug 2018 04:26:55 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7DIIwRS036158
 for <openbmc@lists.ozlabs.org>; Mon, 13 Aug 2018 14:26:52 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2kud8ad1qw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 13 Aug 2018 14:26:52 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Mon, 13 Aug 2018 12:26:51 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 13 Aug 2018 12:26:50 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w7DIQnfE4587884
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Mon, 13 Aug 2018 11:26:49 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 370366E04E
 for <openbmc@lists.ozlabs.org>; Mon, 13 Aug 2018 12:26:49 -0600 (MDT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BF196E056
 for <openbmc@lists.ozlabs.org>; Mon, 13 Aug 2018 12:26:49 -0600 (MDT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Mon, 13 Aug 2018 12:26:48 -0600 (MDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 13 Aug 2018 13:33:53 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: Read-Only IPMI sensors
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18081318-0016-0000-0000-00000919A1BB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009537; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01073024; UDB=6.00552842; IPR=6.00852975; 
 MB=3.00022694; MTD=3.00000008; XFM=3.00000015; UTC=2018-08-13 18:26:51
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18081318-0017-0000-0000-00003FFC5E1D
Message-Id: <6c913a75b11ae03ef9298085ead69afe@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-13_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=515 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1808130185
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
X-List-Received-Date: Mon, 13 Aug 2018 18:26:59 -0000

There are a couple IPMI sensors that are not yet included in the 
data-driven design of IPMI because they're intended to be read-only 
(example: https://github.com/openbmc/openbmc/issues/2154).

Some options to implement these:

1. Add support in sdbusplus for read-only properties and map these 
sensors to a read-only d-bus property.

2. Have a (json?) file with the sensor settings and have IPMI and any 
other interested apps read the file directly to retrieve the sensor 
values.

3. Add read-only sensors to a d-bus object and override the "setter" 
function to be a no-op to prevent the value from being modified.

4. Combination of above / other options.

Thoughts?

Return-Path: <zshelle@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=zshelle@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44CrqV3V6fzDqFv
 for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2019 07:15:17 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x24KF3M3129752
 for <openbmc@lists.ozlabs.org>; Mon, 4 Mar 2019 15:15:14 -0500
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2r18ft6644-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 04 Mar 2019 15:15:13 -0500
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <zshelle@linux.vnet.ibm.com>;
 Mon, 4 Mar 2019 20:15:12 -0000
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 4 Mar 2019 20:15:10 -0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x24KF9XU13828190
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 4 Mar 2019 20:15:09 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7981B28067
 for <openbmc@lists.ozlabs.org>; Mon,  4 Mar 2019 20:15:09 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4789428059
 for <openbmc@lists.ozlabs.org>; Mon,  4 Mar 2019 20:15:09 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Mon,  4 Mar 2019 20:15:09 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 04 Mar 2019 14:22:45 -0600
From: zshelle <zshelle@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: anyone interested in chip register error diagnostics?
X-Sender: zshelle@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19030420-0064-0000-0000-000003B3B55A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010704; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01169630; UDB=6.00611217; IPR=6.00950259; 
 MB=3.00025830; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-04 20:15:11
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19030420-0065-0000-0000-00003C9CA10E
Message-Id: <d6c9b047b8906a7dabc6fc1acf7d7c2d@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-04_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=1
 clxscore=1015 lowpriorityscore=0 mlxscore=1 impostorscore=0
 mlxlogscore=206 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903040144
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
X-List-Received-Date: Mon, 04 Mar 2019 20:15:19 -0000

On POWER, I work on a component that listens for hardware errors 
reported by registers in the system chips (processors, memory buffers, 
I/O chips, etc.) and performs service actions based on those errors. I 
have been working on porting some of this code to the BMC for system 
fatal error analysis (see my work-in-progress proposals: 
https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/18591/ and 
https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/18831/). As part 
of the new design, we are building a generic, data-driven register error 
isolator, which will be used by several applications within POWER. 
However, it has the potential to be useful on other architectures as 
well. I am curious if anyone in the community is interested in this.

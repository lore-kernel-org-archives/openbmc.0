Return-Path: <jrey@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43K75T1XLNzDqMf
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 06:15:24 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wBIJDosR038054
 for <openbmc@lists.ozlabs.org>; Tue, 18 Dec 2018 14:15:23 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2pf5uqjm0w-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 18 Dec 2018 14:15:22 -0500
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.vnet.ibm.com>;
 Tue, 18 Dec 2018 19:15:21 -0000
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 18 Dec 2018 19:15:19 -0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 wBIJFIrH21430386
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Tue, 18 Dec 2018 19:15:18 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47793AE063
 for <openbmc@lists.ozlabs.org>; Tue, 18 Dec 2018 19:15:18 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B0C3AE060
 for <openbmc@lists.ozlabs.org>; Tue, 18 Dec 2018 19:15:18 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Tue, 18 Dec 2018 19:15:17 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 18 Dec 2018 13:19:41 -0600
From: Joseph Reynolds <jrey@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: Translating phosphor-webui [GUI accessibility]
X-Sender: jrey@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18121819-0060-0000-0000-000002E64368
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010244; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000271; SDB=6.01133634; UDB=6.00589348; IPR=6.00913809; 
 MB=3.00024739; MTD=3.00000008; XFM=3.00000015; UTC=2018-12-18 19:15:20
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18121819-0061-0000-0000-000047967106
Message-Id: <f2333c9e1119f06c15c3b1e31ba3e7dd@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-18_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1812180159
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
X-List-Received-Date: Tue, 18 Dec 2018 19:15:25 -0000

The GUI design team talked about an attempt to translate the web GUI 
during the OpenBMC Community Call held on 12/17/2018.  Here are my notes 
of that conversation together with my comments.

An attempt was made to translate the phosphor-webui[1] web application 
from English into German, Chinese, and other languages.  This 
application consists of HTML, CSS, and Javascript code.  The HTML 
contains English phrases which need to be translated.  The JavaScript 
code also likely contains English phrases which would need to be 
translated.

The approach was to copy and modify the English HTML files, one set for 
each target language.  For example, bmc-reboot-controller.html[2] (but I 
didn't record which files were shown during the call).  To use the 
translated version, simply replace the English version with the 
translated version in your OpenBMC image, and your browser will show the 
translated version.

Performing the translation was difficult because the English sentences 
were built from phrases with replacement text in the middle of the 
sentence.  For example, in the sentence, "The processor temperature of 
60 degrees is over the limit of 58", can built from HTML like:
   <p>The processor temperature of</p><script>...get the 
temp...</script><p>degrees is over the limit.</p>.

This presents a problem for translation centers who typically receive 
each phrase separately and may not have visibility to the entire 
sentence.
One might think you could simply re-arrange the HTML elements, including 
the replacement fields, into the sequence you need, but translation 
centers are not typically set up for that.  Besides that, we don't want 
to trust them messing with our HTML files: that is not their expertise.

The problem becomes impossible to translate correctly when the word 
order must be changed (which happens regularly for German) such that the 
replacement text (e.g., 58 and 60 in the example above) must be 
rearranged.  A translation center would reject this and create an issue 
for the web developer to fix this problem.  Hence the recommendation 
(requirement?) is to always keep entire sentences together and never 
build them up from phrases.

We discussed using the AngularJS translation framework.

There were some problems with the way the translated text appeared in 
the web browser window.  Some of the translated text was much longer 
than the English versions; and some of these were clipped instead of 
flowed.  These problems are being addressed by fixing the HTML and CSS 
code.

We talked about other things that may require translation.
  - Translated Redfish schemas[3] for example described by DSP8011.  
Redfish schemas are JSON files served by the BMCWeb HTTP server which 
contain English descriptions of the Redfish APIs.  In BMCWeb, they are 
stored here [4].
  - Are the sensor names supposed to be translated or not?
  - Do we need to translate any phrases in interfaces like the REST APIs 
(Redfish and phosphor-rest), ipmitool, openbmc-tool, and ssh?  The 
thinking was that these are not good candidates for translation.

The decision to translate is driven by balancing the cost of translation 
and preparing for translation (which can be high in terms of developer 
effort and $$) compared to the benefit of the project being usable by a 
wider international audience.

[1]: https://github.com/openbmc/phosphor-webui/blob/master/README.md
[2]: 
https://github.com/openbmc/phosphor-webui/blob/master/app/server-control/controllers/bmc-reboot-controller.html
[3]: https://www.dmtf.org/standards/redfish
[4]: 
https://github.com/openbmc/bmcweb/tree/master/static/redfish/v1/JsonSchemas

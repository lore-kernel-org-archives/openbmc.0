Return-Path: <dkodihal@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40MtX84sRFzF1pj
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 19:58:48 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w3D9vg1c014904
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 05:58:45 -0400
Received: from e06smtp11.uk.ibm.com (e06smtp11.uk.ibm.com [195.75.94.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2harpdctfp-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 05:58:44 -0400
Received: from localhost
 by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Fri, 13 Apr 2018 10:58:42 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp11.uk.ibm.com (192.168.101.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 13 Apr 2018 10:58:38 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w3D9wclQ6685004; Fri, 13 Apr 2018 09:58:38 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3BC211C058;
 Fri, 13 Apr 2018 10:50:40 +0100 (BST)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B882711C04A;
 Fri, 13 Apr 2018 10:50:39 +0100 (BST)
Received: from Deepaks-MacBook-Pro.local (unknown [9.199.202.245])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 13 Apr 2018 10:50:39 +0100 (BST)
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Subject: Serial Over Lan in the webui
To: geissonator@gmail.com, ed.tanous@intel.com, gmills@linux.vnet.ibm.com,
 jayashankar.padath@in.ibm.com, Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 13 Apr 2018 15:28:36 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:52.0)
 Gecko/20100101 Thunderbird/52.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18041309-0040-0000-0000-0000044D2069
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18041309-0041-0000-0000-000020F157FD
Message-Id: <6bb68901-d843-16eb-02ae-588ce52f91a7@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-04-13_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804130092
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
X-List-Received-Date: Fri, 13 Apr 2018 09:58:49 -0000

Hi,

I'm investigating https://github.com/openbmc/openbmc/issues/2736, which 
is about enabling the SOL functionality in the webui 
(https://github.com/openbmc/phosphor-webui).

What the webui currently has is an embedded terminal emulator 
(hterm.js), although there's no ssh connection that's established to the 
host. Basically the SOL doesn't work in the UI.

Also there seems to be two ways in which you can run the UI in general - 
by downloading the webui code, building and running it via a Node server 
(using the node package manager, or npm), or having the REST server on 
the BMC serve up the webui code (html, javascript etc) when someone 
points their browser to https://<BMC>.

Based on my investigation, it might not be possible to get the SOL 
working in the UI via the latter scenario. This is because it doesn't 
seem to be possible to implement an ssh client with client-side html and 
javascript that a browser can run by itself, and that's because 
javascript running in the browser doesn't have raw tcp/ip socket support.

How a "web" ssh client is typically implemented is by using some kind of 
server-side scripting framework, something like Node. For eg I was able 
to get the SOL in the webui working (when I run it via Node of course) 
by implementing a Node server based on ssh2.js, which acts as a proxy 
server. I used socket.io.js to have the terminal and this proxy server 
communicate, the proxy server uses ssh2.js to implement an ssh client to 
connect to the sshd running on the bmc. The key here though is ssh2.js 
can't be executed by a browser (no raw tcp sockets), it requires network 
APIs provided by Node's (or some other server-side technology) runtime.

So the question is how do we solve this when the webui code is served by 
the BMC? Is anyone aware of a pure client-side javascript based ssh 
client? If not, we'd have to run Node or something equivalent on the 
BMC, or have the REST server act as a proxy server between the terminal 
writing to a socket that the rest server can intercept and convert to 
ssh packets. Any other thoughts on how this can be achieved?

Thanks,
Deepak

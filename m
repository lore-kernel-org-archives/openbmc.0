Return-Path: <vishwa@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vishwa@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ftX15ZJNzDqN6
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 17:51:38 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3B7okXL035096
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 03:51:35 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2rt0dbkht1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 03:51:34 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Thu, 11 Apr 2019 08:51:33 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 11 Apr 2019 08:51:31 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3B7pU7S47579212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Apr 2019 07:51:30 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B6B452050;
 Thu, 11 Apr 2019 07:51:30 +0000 (GMT)
Received: from [9.181.94.194] (unknown [9.181.94.194])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 325675204F;
 Thu, 11 Apr 2019 07:51:28 +0000 (GMT)
Subject: Re: Sending the FD over D-bus
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>,
 "Tanous, Ed" <ed.tanous@intel.com>, bradleyb@fuzziesquirrel.com,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <d27b3022-cf65-80e3-fcea-8e7e9027acaa@linux.vnet.ibm.com>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Thu, 11 Apr 2019 15:51:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d27b3022-cf65-80e3-fcea-8e7e9027acaa@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19041107-0012-0000-0000-0000030D9F16
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19041107-0013-0000-0000-00002145C61F
Message-Id: <51da69bb-1cfc-fac2-0bad-f0ad5556ffcb@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-11_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904110056
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
X-List-Received-Date: Thu, 11 Apr 2019 07:51:46 -0000

Unless I am missing something fundamental, are we saying this ?

Process-1:

fd = open(foo);

send(fd) to another process over D-Bus.

-------------------------------

Process-2:

read the "fd" from D-Bus

read(fd,..)

The process-2 would not even have entries in file desc table to map fd. 
So it would return EBADF. If the read succeeds, then it would be a read 
from a locally opened file that returned the same fd number part of open();

!! Vishwa !!

On 4/10/19 3:47 AM, Ratan Gupta wrote:
> Hi All,
>
> As Discussed in yesterday community call, I did some POC to send the 
> unix FD object over the D-Bus.
>
> BackGround: We are exploring the possibilities how to send the secrets 
> from one process to other process,
>
> a) If the IPC is D-bus
>
> b) Calling process doesn't have the root permission to write the 
> secrets in the configuration file.
>
> One of the proposal came, Can the calling process  send the unix fd 
> over the D-Bus instead of sending the actual password
>
> and receiving process reads the data from the sent fd.?
>
> There was a confusion if some other app can snoop the D-bus message 
> and get the FD and read it.I tried to simulate the same
>
> behavior in the POC but not sure whether it is correct or not.
>
> This POC has two files which is attached with this mail.
>
> Dbus-Service(dbus-service-fd-test.py):  Method(readFD) which takes the 
> unix fd as parameter reads it and send the data back
>
> Dbus-Client(dbus-client-fd-test.py): Writes dummy data in the file, 
> then opens the file and send the fd over D-bus.
>
>
> After sending the data over D-bus , I introduced a sleep of 15 sec so 
> that I can try to open the same fd from other
>
> process,I open the python shell and try to open the shared FD but 
> couldn't open it.
>
> Ratan
>
>
>
>
>
>
>
>
>
>
>
>

Return-Path: <dkodihal@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44fBkQ3ZHTzDqHS
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 14:58:22 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3A4rid3135180
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 00:58:20 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rs8y2a304-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 00:58:19 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Wed, 10 Apr 2019 05:58:18 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 10 Apr 2019 05:58:15 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3A4wEuk51576962
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 04:58:14 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23E004C058
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 04:58:14 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C82594C04A
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 04:58:13 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.199.203.20])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 04:58:13 +0000 (GMT)
Subject: Re: Sending the FD over D-bus
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
References: <d27b3022-cf65-80e3-fcea-8e7e9027acaa@linux.vnet.ibm.com>
 <CAPnigKkHnc_zWQDw2XzgUdGLn2rUar7tgwuXsh4rO6L7vCiJ6g@mail.gmail.com>
 <cbd4d001-b440-756e-4a08-55d864d00c46@linux.vnet.ibm.com>
Date: Wed, 10 Apr 2019 10:28:18 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cbd4d001-b440-756e-4a08-55d864d00c46@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19041004-0028-0000-0000-0000035F261D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19041004-0029-0000-0000-0000241E4667
Message-Id: <0c195cff-f440-4e94-9ff7-bf07d068c188@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-10_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904100035
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
X-List-Received-Date: Wed, 10 Apr 2019 04:58:23 -0000

On 10/04/19 10:23 AM, Deepak Kodihalli wrote:
> On 10/04/19 7:43 AM, William Kennington wrote:
>> What is the issue with just sending them over d-bus? The only party
>> that can view the messages outside of the normal unicast partner is
>> the dbus-broker process. You are still trusting the dbus-broker in the
>> file descriptor case. On top of that you are probably still trusting
>> the mapper to give you the correct service name prior to sending the
>> secrets.
> 
> 
> +1
> 
> 
> Ratan,
> 
> In case bmcweb makes a D-Bus method call to phosphor-user-manager, and 
> one of the args of that method call is the password, is the value of 
> that argument even visible to other processes connected to the system 
> bus? If it is, two processes can talk to each other directly using 
> libdbus, that wouldn't even involve the system d-bus daemon/dbus-broker 
> I guess.
> 
> Regards,
> Deepak


https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/19409/1/xyz/openbmc_project/User/Ldap/Config.interface.yaml 
- the password here is a property, I guess that's the concern. Could the 
API instead be a method call taking the password - with that it would 
just be the two processes (and d-bus broker) that would have visibility 
to this.

Regards,
Deepak

>> On Tue, Apr 9, 2019 at 12:49 PM Ratan Gupta 
>> <ratagupt@linux.vnet.ibm.com> wrote:
>>>
>>> Hi All,
>>>
>>> As Discussed in yesterday community call, I did some POC to send the
>>> unix FD object over the D-Bus.
>>>
>>> BackGround: We are exploring the possibilities how to send the secrets
>>> from one process to other process,
>>>
>>> a) If the IPC is D-bus
>>>
>>> b) Calling process doesn't have the root permission to write the secrets
>>> in the configuration file.
>>>
>>> One of the proposal came, Can the calling process  send the unix fd over
>>> the D-Bus instead of sending the actual password
>>>
>>> and receiving process reads the data from the sent fd.?
>>>
>>> There was a confusion if some other app can snoop the D-bus message and
>>> get the FD and read it.I tried to simulate the same
>>>
>>> behavior in the POC but not sure whether it is correct or not.
>>>
>>> This POC has two files which is attached with this mail.
>>>
>>> Dbus-Service(dbus-service-fd-test.py):  Method(readFD) which takes the
>>> unix fd as parameter reads it and send the data back
>>>
>>> Dbus-Client(dbus-client-fd-test.py): Writes dummy data in the file, then
>>> opens the file and send the fd over D-bus.
>>>
>>>
>>> After sending the data over D-bus , I introduced a sleep of 15 sec so
>>> that I can try to open the same fd from other
>>>
>>> process,I open the python shell and try to open the shared FD but
>>> couldn't open it.
>>>
>>> Ratan
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>
> 

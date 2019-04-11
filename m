Return-Path: <ratagupt@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44g7nq04vNzDqS3
 for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2019 03:49:34 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3BHdgMd106556
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 13:49:32 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rt8p6wmkc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 13:49:30 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Thu, 11 Apr 2019 18:49:28 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 11 Apr 2019 18:49:27 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3BHnRL644892164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Apr 2019 17:49:27 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAA34A405B;
 Thu, 11 Apr 2019 17:49:26 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 400C9A405F;
 Thu, 11 Apr 2019 17:49:25 +0000 (GMT)
Received: from [9.85.130.91] (unknown [9.85.130.91])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 11 Apr 2019 17:49:24 +0000 (GMT)
Subject: Re: Sending the FD over D-bus
To: vishwa <vishwa@linux.vnet.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <d27b3022-cf65-80e3-fcea-8e7e9027acaa@linux.vnet.ibm.com>
 <51da69bb-1cfc-fac2-0bad-f0ad5556ffcb@linux.vnet.ibm.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Thu, 11 Apr 2019 23:19:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <51da69bb-1cfc-fac2-0bad-f0ad5556ffcb@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------1E6EAF8A1858ABBD2B184603"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19041117-4275-0000-0000-00000326DB3A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19041117-4276-0000-0000-00003835FCBA
Message-Id: <026ee4cc-7fd2-17a7-146c-08e1000439dd@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-11_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904110118
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
X-List-Received-Date: Thu, 11 Apr 2019 17:49:35 -0000

This is a multi-part message in MIME format.
--------------1E6EAF8A1858ABBD2B184603
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/04/19 1:21 PM, vishwa wrote:
> Unless I am missing something fundamental, are we saying this ?
>
> Process-1:
>
> fd = open(foo);
>
> send(fd) to another process over D-Bus.
>
> -------------------------------
>
> Process-2:
>
> read the "fd" from D-Bus
>
> read(fd,..)
>
> The process-2 would not even have entries in file desc table to map 
> fd. So it would return EBADF. If the read succeeds, then it would be a 
> read from a locally opened file that returned the same fd number part 
> of open();

Yes, it is true that one process(D-Bus service) can send the FD to other 
process(D-Bus service), How this is achieves internally through D-Bus 
implementation, I have not gone through it, But the spec suggest the same.

|UNIX_FD| 	|h| (104) 	Unsigned 32-bit integer representing an index into 
an out-of-band array of file descriptors, transferred via some 
platform-specific mechanism (mnemonic: h for handle)

Please have a look at the poc also, which I shared. Process 2 doesn't 
have any open file, still it reads the data from the shared fd.

>
> !! Vishwa !!
>
> On 4/10/19 3:47 AM, Ratan Gupta wrote:
>> Hi All,
>>
>> As Discussed in yesterday community call, I did some POC to send the 
>> unix FD object over the D-Bus.
>>
>> BackGround: We are exploring the possibilities how to send the 
>> secrets from one process to other process,
>>
>> a) If the IPC is D-bus
>>
>> b) Calling process doesn't have the root permission to write the 
>> secrets in the configuration file.
>>
>> One of the proposal came, Can the calling process  send the unix fd 
>> over the D-Bus instead of sending the actual password
>>
>> and receiving process reads the data from the sent fd.?
>>
>> There was a confusion if some other app can snoop the D-bus message 
>> and get the FD and read it.I tried to simulate the same
>>
>> behavior in the POC but not sure whether it is correct or not.
>>
>> This POC has two files which is attached with this mail.
>>
>> Dbus-Service(dbus-service-fd-test.py):  Method(readFD) which takes 
>> the unix fd as parameter reads it and send the data back
>>
>> Dbus-Client(dbus-client-fd-test.py): Writes dummy data in the file, 
>> then opens the file and send the fd over D-bus.
>>
>>
>> After sending the data over D-bus , I introduced a sleep of 15 sec so 
>> that I can try to open the same fd from other
>>
>> process,I open the python shell and try to open the shared FD but 
>> couldn't open it.
>>
>> Ratan
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
Ratan

--------------1E6EAF8A1858ABBD2B184603
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <div class="moz-cite-prefix">On 11/04/19 1:21 PM, vishwa wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:51da69bb-1cfc-fac2-0bad-f0ad5556ffcb@linux.vnet.ibm.com">Unless
      I am missing something fundamental, are we saying this ?
      <br>
      <br>
      Process-1:
      <br>
      <br>
      fd = open(foo);
      <br>
      <br>
      send(fd) to another process over D-Bus.
      <br>
      <br>
      -------------------------------
      <br>
      <br>
      Process-2:
      <br>
      <br>
      read the "fd" from D-Bus
      <br>
      <br>
      read(fd,..)
      <br>
      <br>
      The process-2 would not even have entries in file desc table to
      map fd. So it would return EBADF. If the read succeeds, then it
      would be a read from a locally opened file that returned the same
      fd number part of open();
      <br>
    </blockquote>
    <p>Yes, it is true that one process(D-Bus service) can send the FD
      to other process(D-Bus service), How this is achieves internally
      through D-Bus implementation, I have not gone through it, But the
      spec suggest the same.<br>
    </p>
    <table class="informaltable" border="1">
      <tbody>
        <tr>
          <td><code class="literal">UNIX_FD</code></td>
          <td><code class="literal">h</code> (104)</td>
          <td>Unsigned 32-bit integer representing an index into an
            out-of-band array of file descriptors, transferred via some
            platform-specific mechanism (mnemonic: h for handle)</td>
        </tr>
      </tbody>
    </table>
    <p>Please have a look at the poc also, which I shared. Process 2
      doesn't have any open file, still it reads the data from the
      shared fd.<br>
    </p>
    <blockquote type="cite"
      cite="mid:51da69bb-1cfc-fac2-0bad-f0ad5556ffcb@linux.vnet.ibm.com">
      <br>
      !! Vishwa !!
      <br>
      <br>
      On 4/10/19 3:47 AM, Ratan Gupta wrote:
      <br>
      <blockquote type="cite">Hi All,
        <br>
        <br>
        As Discussed in yesterday community call, I did some POC to send
        the unix FD object over the D-Bus.
        <br>
        <br>
        BackGround: We are exploring the possibilities how to send the
        secrets from one process to other process,
        <br>
        <br>
        a) If the IPC is D-bus
        <br>
        <br>
        b) Calling process doesn't have the root permission to write the
        secrets in the configuration file.
        <br>
        <br>
        One of the proposal came, Can the calling process  send the unix
        fd over the D-Bus instead of sending the actual password
        <br>
        <br>
        and receiving process reads the data from the sent fd.?
        <br>
        <br>
        There was a confusion if some other app can snoop the D-bus
        message and get the FD and read it.I tried to simulate the same
        <br>
        <br>
        behavior in the POC but not sure whether it is correct or not.
        <br>
        <br>
        This POC has two files which is attached with this mail.
        <br>
        <br>
        Dbus-Service(dbus-service-fd-test.py):  Method(readFD) which
        takes the unix fd as parameter reads it and send the data back
        <br>
        <br>
        Dbus-Client(dbus-client-fd-test.py): Writes dummy data in the
        file, then opens the file and send the fd over D-bus.
        <br>
        <br>
        <br>
        After sending the data over D-bus , I introduced a sleep of 15
        sec so that I can try to open the same fd from other
        <br>
        <br>
        process,I open the python shell and try to open the shared FD
        but couldn't open it.
        <br>
        <br>
        Ratan
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
      </blockquote>
    </blockquote>
    Ratan<br>
  </body>
</html>

--------------1E6EAF8A1858ABBD2B184603--

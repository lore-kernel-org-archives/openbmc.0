Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44gBkJ5HmBzDqDX
 for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2019 06:01:44 +1000 (AEST)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Apr 2019 13:01:30 -0700
X-IronPort-AV: E=Sophos;i="5.60,338,1549958400"; d="scan'208";a="163498633"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Apr 2019 13:01:29 -0700
Date: Thu, 11 Apr 2019 13:01:28 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Cc: vishwa <vishwa@linux.vnet.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Sending the FD over D-bus
Message-ID: <20190411200128.GE15959@mauery.jf.intel.com>
References: <d27b3022-cf65-80e3-fcea-8e7e9027acaa@linux.vnet.ibm.com>
 <51da69bb-1cfc-fac2-0bad-f0ad5556ffcb@linux.vnet.ibm.com>
 <026ee4cc-7fd2-17a7-146c-08e1000439dd@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <026ee4cc-7fd2-17a7-146c-08e1000439dd@linux.vnet.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
X-List-Received-Date: Thu, 11 Apr 2019 20:01:45 -0000

On 11-Apr-2019 11:19 PM, Ratan Gupta wrote:
>
>On 11/04/19 1:21 PM, vishwa wrote:
>>Unless I am missing something fundamental, are we saying this ?
>>
>>Process-1:
>>
>>fd =3D open(foo);
>>
>>send(fd) to another process over D-Bus.
>>
>>-------------------------------
>>
>>Process-2:
>>
>>read the "fd" from D-Bus
>>
>>read(fd,..)
>>
>>The process-2 would not even have entries in file desc table to map=20
>>fd. So it would return EBADF. If the read succeeds, then it would be=20
>>a read from a locally opened file that returned the same fd number=20
>>part of open();
>
>Yes, it is true that one process(D-Bus service) can send the FD to=20
>other process(D-Bus service), How this is achieves internally through=20
>D-Bus implementation, I have not gone through it, But the spec suggest=20
>the same.

It is not necessarily the same. This is accomplished using the msghdr=20
headers in sendmsg (read sendmsg(2) and cmesg(3) and=20
https://keithp.com/blogs/fd-passing/ )

>|UNIX_FD| 	|h| (104) 	Unsigned 32-bit integer representing an index=20
>into an out-of-band array of file descriptors, transferred via some=20
>platform-specific mechanism (mnemonic: h for handle)
>
>Please have a look at the poc also, which I shared. Process 2 doesn't=20
>have any open file, still it reads the data from the shared fd.
>
>>
>>!! Vishwa !!
>>
>>On 4/10/19 3:47 AM, Ratan Gupta wrote:
>>>Hi All,
>>>
>>>As Discussed in yesterday community call, I did some POC to send=20
>>>the unix FD object over the D-Bus.
>>>
>>>BackGround: We are exploring the possibilities how to send the=20
>>>secrets from one process to other process,
>>>
>>>a) If the IPC is D-bus
>>>
>>>b) Calling process doesn't have the root permission to write the=20
>>>secrets in the configuration file.
>>>
>>>One of the proposal came, Can the calling process=A0 send the unix=20
>>>fd over the D-Bus instead of sending the actual password
>>>
>>>and receiving process reads the data from the sent fd.?
>>>
>>>There was a confusion if some other app can snoop the D-bus=20
>>>message and get the FD and read it.I tried to simulate the same
>>>
>>>behavior in the POC but not sure whether it is correct or not.
>>>
>>>This POC has two files which is attached with this mail.
>>>
>>>Dbus-Service(dbus-service-fd-test.py):=A0 Method(readFD) which takes=20
>>>the unix fd as parameter reads it and send the data back
>>>
>>>Dbus-Client(dbus-client-fd-test.py): Writes dummy data in the=20
>>>file, then opens the file and send the fd over D-bus.
>>>
>>>
>>>After sending the data over D-bus , I introduced a sleep of 15 sec=20
>>>so that I can try to open the same fd from other
>>>
>>>process,I open the python shell and try to open the shared FD but=20
>>>couldn't open it.
>>>
>>>Ratan
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
>Ratan

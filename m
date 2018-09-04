Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 424dKm5QVMzF37J
 for <openbmc@lists.ozlabs.org>; Wed,  5 Sep 2018 06:12:27 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 4EABF6DD32;
 Tue,  4 Sep 2018 16:12:22 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: Proposal for caching/buffering POST codes list for one boot
 process.
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <959CAFA1E282D14FB901BE9A7BF4E77249E068BE@shsmsx102.ccr.corp.intel.com>
Date: Tue, 4 Sep 2018 16:12:21 -0400
Cc: "kunyi731@gmail.com" <kunyi731@gmail.com>,
 "Mihm, James" <james.mihm@intel.com>, "Tanous, Ed" <ed.tanous@intel.com>,
 "Li, Yong B" <yong.b.li@intel.com>, "Feist, James" <james.feist@intel.com>,
 "Jia, Chunhui" <chunhui.jia@intel.com>,
 "venture@google.com" <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Xu, Qiang" <qiang.xu@intel.com>, "Yang, Cheng C" <cheng.c.yang@intel.com>,
 "chunhui.jia@linux.intel.com" <chunhui.jia@linux.intel.com>,
 "geissonator@yahoo.com" <geissonator@yahoo.com>,
 "Nguyen, Hai V" <hai.v.nguyen@intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C92B9CD1-4673-455D-995B-20F3A289BED8@fuzziesquirrel.com>
References: <959CAFA1E282D14FB901BE9A7BF4E77249E020C3@shsmsx102.ccr.corp.intel.com>
 <7E9441B1E5EFFD4681F54958E8216993458353D7@ORSMSX114.amr.corp.intel.com>
 <CAO=notwzyahJ3onTynwoSff6y5NamoHRH_PtdwAyt2sgUNZh_A@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E8216993458355BC@ORSMSX114.amr.corp.intel.com>
 <2018082715593358738018@linux.intel.com>
 <7E9441B1E5EFFD4681F54958E821699345835CCF@ORSMSX114.amr.corp.intel.com>
 <CADNDqJzNhd_ApA83F8BubFUaGfrc2+W8TPw6_9PZCPwUvxH-+Q@mail.gmail.com>
 <CADNDqJwvMaGXCiFGO+3iEgNG=S=BLA=CVgZ8N2-e8m==KMGwbw@mail.gmail.com>
 <CADNDqJw8hnOGP3YEW0eS5CN7BLJ6Gu6tTxSugcJFrzrwYS7EJA@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E821699345836607@ORSMSX114.amr.corp.intel.com>
 <959CAFA1E282D14FB901BE9A7BF4E77249E05E02@shsmsx102.ccr.corp.intel.com>
 <2F9169B5-BA73-4157-BEA4-2F80B8051757@fuzziesquirrel.com>
 <959CAFA1E282D14FB901BE9A7BF4E77249E068BE@shsmsx102.ccr.corp.intel.com>
To: "Wang, Kuiying" <kuiying.wang@intel.com>
X-Mailer: Apple Mail (2.3445.9.1)
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
X-List-Received-Date: Tue, 04 Sep 2018 20:12:29 -0000



> On Aug 30, 2018, at 3:23 AM, Wang, Kuiying <kuiying.wang@intel.com> =
wrote:
>=20
> Hi Brad,
> 1. Accept your suggestion.
>     Define an interface PostCodeList.yaml under =
"/xyz/openbmc_project/State/Boot =E2=80=9C
> 2. Accept your suggestion
>    Define a property "List" w/ type "array[uint64]=E2=80=9D
> 3.  Accept your suggestion
>    To create a new dbus object for different boot cycle but not using =
end flag
> 4. compare w/ "phosphor-host-postd", it is suitable for client. But =
for other module like IPMI command tool, it is kind of server.
>    How about "phosphor-post-code-manager"? do you think it is ok?

phosphor-post-code-manager sounds fine, thanks.

>=20
>=20
> Thanks,
> Kuiying.
>=20
>=20
> -----Original Message-----
> From: Brad Bishop [mailto:bradleyb@fuzziesquirrel.com]=20
> Sent: Wednesday, August 29, 2018 8:20 PM
> To: Wang, Kuiying <kuiying.wang@intel.com>
> Cc: Tanous, Ed <ed.tanous@intel.com>; kunyi731@gmail.com; Xu, Qiang =
<qiang.xu@intel.com>; Mihm, James <james.mihm@intel.com>; Nguyen, Hai V =
<hai.v.nguyen@intel.com>; Feist, James <james.feist@intel.com>; Jia, =
Chunhui <chunhui.jia@intel.com>; venture@google.com; =
openbmc@lists.ozlabs.org; chunhui.jia@linux.intel.com; Yang, Cheng C =
<cheng.c.yang@intel.com>; Li, Yong B <yong.b.li@intel.com>; =
geissonator@yahoo.com
> Subject: Re: Proposal for caching/buffering POST codes list for one =
boot process.
>=20
>=20
>=20
>> On Aug 29, 2018, at 12:44 AM, Wang, Kuiying <kuiying.wang@intel.com> =
wrote:
>>=20
>> Thanks a lot for you all comments and suggestions.
>> Let me summary and update my solution now.
>> 1. Define an interface to post code list "CodeList.yaml" in " =
phosphor-dbus-interfaces" repo.
>>    Under folder " xyz/openbmc_project/Post /=E2=80=9C
>=20
> I suggest /xyz/openbmc_project/State/Boot
>=20
> This is where Patrick put the existing post code interface (Raw).
>=20
>> 2. Define a property "PostCodeList" w/ type "array[uint64]"=20
>> (std::vector<uint64_t>)
>=20
> How about just List?  or History?  Something without =E2=80=9CPost=E2=80=
=9D in it please.
> We have a similar concept on POWER and I can implement this interface =
but we don=E2=80=99t call them post codes.
>=20
>> 3. Developing a post code client to monitor and collect all the post =
codes.
>>       a). define a "MAX_BOOT_CYCLE_NUM" to limit how many boot cycle =
post codes can be buffered.
>>       b). when a post code comes, push back to the end of CodeList =
array.
>>       c). when a boot cycle ends, push end flag like "0xffff *** ffff =
" to the end of CodeList array.
>=20
> Can we just create a new dbus object in this situation?  Rather than =
shoving multiple boots into a single object with ffff delimeters?
>=20
>>       d). when hit to max boot cycle number, delete one cycle post =
code set at the beginning of CodeList array.
>>       e). save CodeList property into file system " =
/var/lib/phosphor-state-manager/postCodeList=E2=80=9D
>=20
> This would be whatever we call this new application.  =
/var/lib/phosphor-state-manager is for the phosphor-state-manager =
program's state data.
>=20
>> 4. create a new repo for post code client " =
phosphor-host-post-code-client=E2=80=9D.
>=20
> Why is it a client?  Is it also a server?
>=20
>>=20
>> Thanks,
>> Kuiying.
>=20
> Thank you!
>=20
>>=20
>>=20
>> -----Original Message=E2=80=94=E2=80=94
>=20
> This is called top posting, please try to avoid when using the =
mail-list.
> It makes threaded conversation hard to follow and respond to.  thx.
>=20
>> From: Tanous, Ed
>> Sent: Tuesday, August 28, 2018 2:10 PM
>> To: kunyi731@gmail.com
>> Cc: chunhui.jia@linux.intel.com; venture@google.com; Wang, Kuiying=20
>> <kuiying.wang@intel.com>; Mihm, James <james.mihm@intel.com>; Nguyen,=20=

>> Hai V <hai.v.nguyen@intel.com>; Feist, James <james.feist@intel.com>;=20=

>> Jia, Chunhui <chunhui.jia@intel.com>; openbmc@lists.ozlabs.org; Li,=20=

>> Yong B <yong.b.li@intel.com>; Yang, Cheng C <cheng.c.yang@intel.com>;=20=

>> bradleyb@fuzziesquirrel.com; Xu, Qiang <qiang.xu@intel.com>;=20
>> geissonator@yahoo.com; Kun Yi <kunyi@google.com>
>> Subject: RE: RE: Proposal for caching/buffering POST codes list for =
one boot process.
>>=20
>>> Obvious another thing we would need to consider is performance. A=20
>>> host booting session could produce dozens or hundreds of POST codes =
depending on how verbose the BIOS is, and we should be careful not to =
design something that creates too much DBus traffic. These embedded =
processors are not performance ?
>>> beasts by any means.
>>=20
>> I would be really surprised if POST codes were ever a performance =
bottleneck even in with the worst implementation possible.  Hundreds of =
post codes in a minute is still orders of magnitude less data than the =
sensors are already pushing over DBus.
>>=20
>>> On Mon, Aug 27, 2018 at 4:52 PM Kun Yi <kun.yi.731@gmail.com> wrote:
>>> I think the choice of *where* to put such buffering warrants some =
thoughts and design. Going through what I have thought:
>>=20
>>> 1. It's possible to implement host state detection and host POST =
code=20
>>> buffering all in a client daemon, which is a long-lived process that
>>> - keeps listening to POST codes published
>>> - keeps polling host state
>>> - when host power state toggled, write the POST codes received to a=20=

>>> file on disk
>> This would mean that partial boots, or boots that have over current =
issues wouldn't be persisted at all.  It's a bit of an implementation =
detail at this point, but I suspect we're going to want to persist post =
codes more often than just every boot.
>>=20
>>> Pros of this approach is that server daemons are kept simple. POST =
code server doesn't need to talk to host state daemon or even assume its =
existence.
>>> Pros of buffering on server side: potentially there will be more =
than=20
>>> one identities needing the list of POST codes. IPMI? Logging? It =
would really help if we can identify some concrete use cases.
>> I think we also need to consider that the POST code saving mechanism =
should be up as soon as possible after boot to make sure that in the =
case where power restore policy is set to ON, we can capture as many =
post codes as possible from the host booting.  In previous =
implementations, this meant buffering in the kernel driver, and making =
the application a lightweight system for persisting POST codes, rather =
than actually capture them itself.
>>=20

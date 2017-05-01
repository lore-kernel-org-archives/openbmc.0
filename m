Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wGnD7269HzDq7Z
 for <openbmc@lists.ozlabs.org>; Tue,  2 May 2017 00:41:10 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Switching to 4.10
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <cef1105a-bffd-a760-3c2f-cbc74b220685@linux.vnet.ibm.com>
Date: Mon, 1 May 2017 10:41:06 -0400
Cc: Joel Stanley <joel@jms.id.au>, Edward James <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <487D47C8-98DF-43B6-97C6-D14813A9443D@fuzziesquirrel.com>
References: <CACPK8XfFF7tNrLjroNA05-c3pMZWFbiKvHq+oFLjBDSkgqfjDw@mail.gmail.com>
 <CAPH-5w6-2zVQn2iNVP28aOAS_r11rxGYCrioXCR-sX8Ln7_BZQ@mail.gmail.com>
 <CAPH-5w4OS_oT5MMu2kEOUwtOza_LO94vwSH9dZHpVMa_4OA38Q@mail.gmail.com>
 <CAPLgG=nuU5befF4AfheWAbnU7tYPCpZSnj+-Zk8MDkvaKek+uw@mail.gmail.com>
 <CACPK8XdLpPYitsvg9Eaw+g4jRX0Ki=9oBCtgtd9fx=_XevdfhA@mail.gmail.com>
 <a0cb1ba8-19e0-bbdf-d343-7463395e72bf@linux.vnet.ibm.com>
 <CACPK8XfNoBfGVtXN_gKQZMxKaK_krZDjpPq4kCcyrcR7AZ3Dmw@mail.gmail.com>
 <cef1105a-bffd-a760-3c2f-cbc74b220685@linux.vnet.ibm.com>
To: Matthew Barth <msbarth@linux.vnet.ibm.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 01 May 2017 14:41:11 -0000


> On May 1, 2017, at 10:33 AM, Matthew Barth =
<msbarth@linux.vnet.ibm.com> wrote:
>=20
>=20
>=20
> On 04/27/17 8:24 PM, Joel Stanley wrote:
>> On Fri, Apr 28, 2017 at 1:39 AM, Matthew Barth
>> <msbarth@linux.vnet.ibm.com> wrote:
>>>=20
>>> On 04/27/17 2:33 AM, Joel Stanley wrote:
>>>> On Thu, Apr 27, 2017 at 3:00 AM, Rick Altherr <raltherr@google.com> =
wrote:
>>>>> I saw Joel started https://gerrit.openbmc-project.xyz/#/c/2846/ =
which has
>>>>> a
>>>>> defconfig for ast2400.  If you have one for ast2500, please upload =
a new
>>>>> patch set to that change.
>>>> I have defconfigs in the tree that are ready to go. I will upload =
them
>>>> to Gerrit when I get the chance.
>>>>=20
>>>> I've pulled in:
>>>>=20
>>>>   - Ben's ftgmac100 patches from the net-next tree
>>>>   - Brendan's i2c patches, v7
>>>>   - Andrew's GPIO and Pinconf patches from the gpio and pinconf =
trees
>>>>   - Chris Bostic's FSI series, v6
>>>>=20
>>>> These are going through a test cycle on the ast2500evb and Plametto
>>>> tonight. Once I have an ack for the i2c device tree, I will add =
that
>>>> to the tree and push to github.
>>>>=20
>>>> Eddie, can you let me know which version of your OCC hwmon patches =
you
>>>> want included. Same goes for the CFAM I2C patches. If you want to =
wait
>>>> for review then please ping your reviewers and we can see if we can
>>>> get the patches reviewed before we include them.
>>>>=20
>>>> Brad, can you point me to the SBE FIFO work that you want included. =
If
>>>> you would prefer to wait for review that is okay.
>>>>=20
>>>> Matt, I think do you want to merge the MAX31785 hwmon driver as-is =
for
>>>> now?
>>> I thought we already have a MAX31785 driver merged, so what is
>>> 'as-is'...does that include the update supporting reading the tach =
feedback
>>> from both rotors as described in
>>> issue#652(https://github.com/openbmc/openbmc/issues/652)? The commit =
you
>>> referenced in that issue does not have the dual tach feedback =
support yet.
>> No, that driver is not upstream and therefore it is not in the tree.
>> It needs to be included in the OpenBMC tree as part of this work.
>>=20
>> Thanks for clarifying the issue about dual tach feedback.
>>=20
>> Is it useful for you to have the driver merged as-is, or does it need
>> to have that feature enabled before you can do any testing?

Sorry Joel, I asked for this to be merged without full understanding.  =
We are already
testing with a driver that supports a single feedback entry.  So I=E2=80=99=
m now confused as
to what you would be merging that we don=E2=80=99t already have in the =
interim before its
reworked to include the extra bytes?

Is it a case of its in our 4.7 branch but not in the 4.10 branch?  In =
that case please
do merge to 4.10, as we don=E2=80=99t want to go backwards so we can =
continue to test with what
we have so far.

> It would be best to have both tach feedbacks for this. Whatever the =
current driver interface that hwmon is using provides enough =
functionality for reading a single rotor's feedback along with being =
able to set a target speed to the fans currently. Because of this, I'd =
prefer that we focus on getting the dual tach feedback added and merge =
the complete driver then.
>=20
> Thanks,
>=20
> Matt
>>=20
>> Cheers,
>>=20
>> Joel
>>=20
>>> At this point in time, it's important we get the MAX31785 driver =
updated
>>> with this support along with the PCA9552 driver presence & led =
verification
>>> of the fan enclosures.

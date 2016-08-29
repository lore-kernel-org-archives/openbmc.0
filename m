Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sNFCC5TNkzDrJq
 for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2016 00:58:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=RkQNQmms; dkim-atps=neutral
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com B5557288B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1472482705;
 bh=NQmNDYZ85duK13acOhO7VElaH5hAhfZk2Kd+3aVZ09o=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
 b=RkQNQmmsjz4TYV6TOoFjSKi8oeT3NJWGr/HsHA6kjYRwih7OK+IqHrDt8shlzKMza
 dsGyPSBj5I68lJPvdY/NdPUtU3Nu/dIipfKcFIKua6XSozrfFrwUkxv3iHW/XLGb6X
 8zI+LtCQ4JRKUR6bGCpglZ3TjVGn7cscJg6VjpRI=
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: Repository integrity (Re: OpenBMC v1.0.5 released.)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CACPK8XeWuKOy-FwpU1dLwGz6woRQ3SGhpOr-S4pQmd1h8B0t1Q@mail.gmail.com>
Date: Mon, 29 Aug 2016 10:58:24 -0400
Cc: Patrick Williams <patrick@stwcx.xyz>,
 Stewart Smith <stewart@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6B9F3B6E-E1FA-4714-9620-193E18946B97@fuzziesquirrel.com>
References: <CACPK8XeWuKOy-FwpU1dLwGz6woRQ3SGhpOr-S4pQmd1h8B0t1Q@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Aug 2016 14:58:32 -0000

Just to be clear, my github account wasn=E2=80=99t compromised.  My imap =
account was (or I got an OS X virus) =E2=80=A6the thread reply addresses =
were just harvested and spammed.

-brad

> On Aug 29, 2016, at 1:47 AM, Joel Stanley <joel@jms.id.au> wrote:
>=20
> Hey Patrick,
>=20
> On Wed, Aug 24, 2016 at 6:33 AM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>> Due to a major regression, I re-tagged v1.0.5 with the kernel updates
>> removed.  The change log is therefore just:
>=20
> I don't think we should ever overwrite a tag that has hit the public
> repository. There's no harm in doing a quick second tag.
>=20
> This is particularity important in the context of Brad's account
> becoming compromised recently.
>=20
> Can tags be pushed to Gerrit and reviewed through it's interface?
>=20
> Would Github's protected branches feature have stopped you from being
> able to make this change?
>=20
> https://help.github.com/articles/about-protected-branches/
>=20
> Cheers,
>=20
> Joel
>=20
>>     * Cache all inventory properties and preserve inventory during =
BMC
>>       firmware update (openbmc/openbmc#487)
>>     * Update the power button behavior on Barreleye to:
>>         * Short press: Only power on. Remove the power off action.
>>         * Long press (>3 seconds): Hard power off.
>>=20
>> On Mon, Aug 22, 2016 at 12:57:34PM -0500, Patrick Williams wrote:
>>> Another fix release for the v1.0.x stable tree was tagged today.
>>>=20
>>> https://github.com/openbmc/openbmc/releases/tag/v1.0.5
>>>=20
>>> Changes since v1.0.4:
>>>    * Cache all inventory properties and preserve inventory during =
BMC
>>>      firmware update (openbmc/openbmc#487)
>>>    * Update the power button behavior on Barreleye to:
>>>        * Short press: Only power on. Remove the power off action.
>>>        * Long press (>3 seconds): Hard power off.
>>>    * Kernel version update:
>>>        * Stable release 4.4.18
>>>        * Ensure the LEDs stay at the same state on boot =
(openbmc/linux#98)
>> --
>> Patrick Williams
>>=20
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
>>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

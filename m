Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MYFT3XMTzDqdt
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 08:02:04 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: Request for Feedback :: Time Mode setting in timemanager
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20200218205231.GD2219@patrickw3-mbp.lan.stwcx.xyz>
Date: Tue, 18 Feb 2020 16:01:58 -0500
Cc: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B85A545E-2557-41AD-AF8E-C516B18B066B@fuzziesquirrel.com>
References: <68732B2D-EB7D-418A-86D9-3095223A31FB@linux.vnet.ibm.com>
 <5B7FD9A0-8A4A-4BCC-9BC5-77B5DEBCDD00@fuzziesquirrel.com>
 <20200218202507.GA2219@patrickw3-mbp.lan.stwcx.xyz>
 <25B4F046-9688-4F23-909E-A5D929349E84@fuzziesquirrel.com>
 <20200218205231.GD2219@patrickw3-mbp.lan.stwcx.xyz>
To: Patrick Williams <patrick@stwcx.xyz>
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
X-List-Received-Date: Tue, 18 Feb 2020 21:02:06 -0000



> On Feb 18, 2020, at 3:52 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
>> oes this have to do with what is going on, on the BMC?
>=20
> When the BMC owns the hardware RTC, { Manual , Host } is the only mode
> that allows the Host to utilize the RTC hardware without being subject
> to the provider's time infrastructure.

Would this be in a situation where the lessee can=E2=80=99t run NTP on =
the host?=

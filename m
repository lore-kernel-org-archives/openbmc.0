Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="XP5YEXNb"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40y39K6q73zDrpC
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jun 2018 22:12:05 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 9013A5396A
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jun 2018 12:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1527855119; x=
 1529669520; bh=/8vTHAkCrvNI9VXrQ7DdCP4ejSwbrTO6hJPvq0Rp2L0=; b=X
 P5YEXNbUeBOwYWzCc8gc1/zl28j7wBsYL3Jr8bgIljRiytySG8A7StBGfF5uJ6ft
 not5k0p4oMaQZrVIXHnK+xi5KbrsSC0Fmqpj3Z+alJuAKetYn3eAVEjMCSed4S/R
 LVvPbvkXXrjx3YH/CTfgbo2VwFpNGYGaToljs6z7IY=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KY5qA7SK-Uvx for <openbmc@lists.ozlabs.org>;
 Fri,  1 Jun 2018 15:11:59 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 1D3C351727
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jun 2018 15:11:58 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 1 Jun
 2018 15:11:58 +0300
Subject: Re: Logging user actions
To: <openbmc@lists.ozlabs.org>
References: <c0569989-b52d-745e-06fb-e92cbb1234c8@yadro.com>
 <5fe8ee1a-d4c3-e5f4-059e-d2f403849d6a@linux.vnet.ibm.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <a29d9411-8000-0361-6e28-c668d2d9923f@yadro.com>
Date: Fri, 1 Jun 2018 15:11:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <5fe8ee1a-d4c3-e5f4-059e-d2f403849d6a@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="zbqxm6JBCQch9rXwtytLrluUmWKwTTbRD"
X-Originating-IP: [172.17.14.168]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
X-List-Received-Date: Fri, 01 Jun 2018 12:12:07 -0000

--zbqxm6JBCQch9rXwtytLrluUmWKwTTbRD
Content-Type: multipart/mixed; boundary="M25YFPFcDtjDwyGn3HwevgD0n2eC0JG29";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: openbmc@lists.ozlabs.org
Message-ID: <a29d9411-8000-0361-6e28-c668d2d9923f@yadro.com>
Subject: Re: Logging user actions
References: <c0569989-b52d-745e-06fb-e92cbb1234c8@yadro.com>
 <5fe8ee1a-d4c3-e5f4-059e-d2f403849d6a@linux.vnet.ibm.com>
In-Reply-To: <5fe8ee1a-d4c3-e5f4-059e-d2f403849d6a@linux.vnet.ibm.com>

--M25YFPFcDtjDwyGn3HwevgD0n2eC0JG29
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

30.05.2018 17:09, Deepak Kodihalli wrote:
> On 28/05/18 5:30 pm, Alexander Amelkin wrote:
>> Hi all!
>>
>> Customers ask us for extensive user action logging. That is, they want=

>> to log everything that a user may change in the system. They want to
>> know who, how (via which interface) and when changed what. That includ=
es
>> but is not limited to network configuration, host power on/off, reboot=
s,
>> power restoration policy changing, firmware updates, user
>> addition/deletion and password changing, et al.
>>
>> We could listen for dbus signals and log most of that, but that way we=

>> wouldn't know whether a user made a change or that was some internal
>> work. Additionally, that would yield an enormous amount of data logged=

>> if we just log every property change. We could limit logging to a
>> predefined subset of properties, but when later the community adds a n=
ew
>> crucial property, we could miss it in our logs.
>>
>> We could log requests at each user interface (thankfully, we don't all=
ow
>> shell access for users), but that would mean having copies of the same=

>> logic in different subsystems, which is error prone, plus those copies=

>> will definitely diverge with time.
>>
>> Does anyone have any idea on how to best implement such a requirement?=

>
>
> phosphor-dbus-monitor has event monitoring support. You can specify
> via build-time config (YAML files) what D-Bus interfaces/properties
> you're interested in, and a corresponding "event" D-Bus object is
> created under the /events/<event_category>/ namespace. This was
> implemented via
> https://github.com/openbmc/openbmc/issues/2254.
>
> This doesn't address all of the concerns you've mentioned above in
> terms of the amount of data that can be logged. It helps specify the
> properties of interest though, and the event D-Bus objects are
> persisted upto a certain limit.
In fact it doesn't address even more. D-Bus doesn't have any accounting
information in its events/signals. phosphor-dbus-monitor is a great
thing, but it has no clue as to who (which user from which IP address)
has requested a HostTransition to 'off', etc.

It would be great if we weren't using D-Bus at all or if we had all user
interfaces connected to some central hub so that accounting information
was available to that hub and it could log all user requests before
translating them further to D-Bus.

Don't IBM, Google, Intel and other big guys want to log user actions?
It's quite strange to not have this functionality in OpenBMC and, what
is more important, not have the architectural possibility to properly
(in a single place) implement it. It feels like I'm just missing somethin=
g.

Alexander.


--M25YFPFcDtjDwyGn3HwevgD0n2eC0JG29--

--zbqxm6JBCQch9rXwtytLrluUmWKwTTbRD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJbETgOAAoJEOiTWHtbdBeNVl8P/1loA454DJldQInJ/St28iW+
RQt+TGmZ2Q06HjrjVvhGOfC5xIaGXUBbhd5wb849Qo1s+XZ4mSRX6ph65KQdey7g
GPN/SjpmnjkAz5em/dAntsB5MQWIt2FeXX7yBRcIMPuSBgpc0BLePLiixkKrT7Lt
jrDOaVQ9HmT3Z1MPMfEoCTlnwgLc22W8vvUBwxgLP0wrNOndIjJv9I7BHZQ19X8t
pI4bOuLrwWckHcy6WBYCQC5qvP1Ep/7wOwuJKD91nHwEIn4pccGCrSmXtaim75tM
/DNKfMDSiMv/gD0yaPk8CaOGgrypP5YbxnsyQULG1lGdDRersO/CUCLeApAyOaiS
1rIbSN6UIlLhN4gbJdG6GnzBcqmYcrl13f3xEqxhzvS5qjIglqkmyNt67w5rvawY
m5ARVaNGRfyjYY4goTeqf3b55+xSZ0RXteES99cTYJgajXNeaY+EK6VDMBEBnxok
eKuqIeQOl1yI2BKGxiXGC8+HmyGgCR0b6Aoe2gCdz7iWrPK6aZxMLrid/MOgOC3K
I+sTXV8TCCLmFVTiyKq4l8OtYhVEm3TTjPu6CQ5tiK/xK3a4CU184Gy9HqjjJMpa
k0Iil/MhXChC1D/14YNCxOhSD7IizR0vYC6GU/mYXNCllsnG3P0UbsgtsRu2lT8o
KDuM0FrI7VxcfyS84enH
=IwTr
-----END PGP SIGNATURE-----

--zbqxm6JBCQch9rXwtytLrluUmWKwTTbRD--

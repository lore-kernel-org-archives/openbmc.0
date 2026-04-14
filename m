Return-Path: <openbmc+bounces-1810-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A29FF9D0C2
	for <openbmc@archiver.kernel.org>; Tue, 14 Apr 2026 11:26:55 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fw26b6ZVKz2yYY;
	Tue, 14 Apr 2026 21:26:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::929" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1776166007;
	cv=pass; b=OFqnZdqaQ/B52WL4UJfjdxOvxi7zRQIRdSDJnbZ4TNGbqUvutwuKhcclyHxdEM4NH3L/eGjoYuEEiD0w4CLw6cTNSzYQZCOndHta1i+JVM2FGh9ZdhRhfxkwMyW+OSz5kD2OJKJqH9AJV32b40owlHOXaqgBglJCvGe8ku9jE2fY9T8SllxutPEky5wjC7ah7G+Kn9w/czZwnvSM+tNHcoH20kHtXEDWm+IXtg9Y374gtb4W7kHcrtt25u8QiV8p+4ps5rtQzxGZuD221MKJXqqCQsYAD8+e/sJPJNckFElNnvVZVtc1QYyfYy4I8idr8wbucQKsXqCzGa+4yCL+IQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1776166007; c=relaxed/relaxed;
	bh=ilCqNNBjn9SRGQmyYZZZU96+TcSOw9/ATEfWbKG3uGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KES7V5eLwPuizKjP6cbqcKkf0VgdiIgy0Q9AXpZYQ7jkbj30f9OQdX5OtMGEjwFWRdHO7tnTuzjxGKeyG0QfTMzUIK3rJH+hgttzEqXJjl7K4tsiTkQAxJDkCSDvjELRKsLkygUrIVA402L9CTad458TnCl3kr2ag3eGNMU3202z4GRqUwYp64S+I5A33qhk/cbmuE1EluqK5La3zgBaCHjHXNI3mtvmMndzm1VpEpyO9zxIZo1fpijCmMMwhz2Q8x7XstMXkBj28M0MPyqwWocL07CaQqyUz+eNTV9ijyFZU+5tOPRWWxUIAtN6eN7Ej+16UvOeOKSvSDkuWAWssw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rJ6At4+m; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::929; helo=mail-ua1-x929.google.com; envelope-from=ratankgupta31@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rJ6At4+m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::929; helo=mail-ua1-x929.google.com; envelope-from=ratankgupta31@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fw26Y0Kmdz2xSB
	for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2026 21:26:44 +1000 (AEST)
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-956948531a1so495423241.2
        for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2026 04:26:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776166002; cv=none;
        d=google.com; s=arc-20240605;
        b=AeTsmzeDhDOIEQS/Ggbw10Ir4xXN2ESpAABFBhvhmYi+mLkgNmq+R9cZnHn1sMEQmG
         r7TeBPEKQlpj9LuzZ0gQZ5oSK34Ne7uOYzf0wi2P/WpKoSKISpsuOYj+EW9fyO3pzjL+
         niqhK1Wc9fKWaKc9HW/9HYss2wbfyoK1rKCgCiJgHd0sQCpDNV152wdrtybZuSkrxqBI
         Rsz9yp+HbViXB9e5B5XG8D2bC8Zg9OpiJpMwCLorRtsmL1n36b7F/0kO/V00hfEpfbxX
         5R1HyyxlnUQxi0Ox3sfk2CU/i6APjxAAS0EkPCWfukTiELafBHimIyCuPdspO+9kZ6DV
         WwAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ilCqNNBjn9SRGQmyYZZZU96+TcSOw9/ATEfWbKG3uGU=;
        fh=7Xa0X2m0VZDBfqDqGpTlyX9qP6j1013d8GBswhn6YC0=;
        b=j/GYrFG5MrFOjzl1eJnUQhb41xYrneTz5FKC/TnECcv3JlVCqs+J05yJYgvTikyNXf
         GhuQ4OrR3vTpVZKhEBxYN1GwDo6p28px2RFadFF/1c1QWWV2BovxdE2LpEe2Yxx/8CuY
         Ibkp4KlU2pJDEjy6N7hrS01lpq9aQsCjdas8YwYp90wbakCDVa3yGp/Nn/s7Flhh45NX
         frSLPH6E7KZCujqz0892tgPjeW3yAJy6ARiaeodShpY6UJJBS8sq76wvuY37WK444cTS
         OA4S4J2HRpYiumDEnbfNl19Os9txkE6reyT9JlXls5ImB2tXWBURAs0f84Iq6i7Hil6n
         AYoA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776166002; x=1776770802; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ilCqNNBjn9SRGQmyYZZZU96+TcSOw9/ATEfWbKG3uGU=;
        b=rJ6At4+m5FImK+UMb1UIMFyusxItIpIDSGzFsMMXqVL/Z9w60F87+LCbFJSc2Mymz+
         BPfrBNl/sufkYlJAN0JO0XCzSTA0Qgs5bBZJjv19JLP6J5Kt6qTb5JP/rNO8hMXPluTW
         vTC42b1U+pkujvfxO1puVp/uq4qHNBs6Obkb5ywvYQQM09o5fIGoLOfbA4gkNc10usLF
         cmPglXHkhzLmz8jHAt21tnq5nJ4KFLmpe3bOMmMrC1HePMURvLk37fvFD9xdpgpJZykY
         TltrGYQbLAfwb7bHGRvh1ZadETz8CghqyIlHyBVWArfQzVAUfGrtfvWlMTly0B/P1E7q
         PLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776166002; x=1776770802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilCqNNBjn9SRGQmyYZZZU96+TcSOw9/ATEfWbKG3uGU=;
        b=ighS67g5vCe/7NKCzC1eGlLV+LiPxZoqrBLlUgwYrXa8eO1YvHWkabTC4/OVAKavq1
         0petMpuf8d/ChkGu/qeggQkW09uBm3cSJai5oOUZL38vZGZljW2K8H3mqhzkm7nvMnE3
         +if8dQY48EbiggSn7xOBSW6z9a2VShj0voTn6x90Fp45qjuYAfvwEc+kMtUkLuAYMDVn
         gWvhWXK+HaV1WUCQCOHf6Ke+j+W/FZ0h09J4NUWwHrb4EEiN+dwg36sa3/OEveW41fSB
         rCvBnE1tRzYORXh+cd6rJlNoL0IMsnVwuRiPvzyPUP1ymlYhBtQFIed9liZpJUEsFvKO
         cOQQ==
X-Gm-Message-State: AOJu0YzWEDvM/x1HUGP4JmxCq2+P1O6OZiVzqAcgdRmXjYjawB3NNikW
	AFRnk8xE03vbqBiELTUBT2t3PxQlf1CtqSwI/3DI+IzNpCkBxjHBHQCb3IMhZi4OqGlVfYlcRTI
	b9+ADyzPtN1HTU71gpaLfkGXcv4ScnWQ=
X-Gm-Gg: AeBDiesFHK480OwnrnGvjbzuxP67EDmCRn23xPsmkQWI8RDQ4B70+wQGhJCdcumPsad
	ro68s9IUw+DWhKPDwtqWxaJHTE+gxo58QgsUw3NH3SlROgKSkepVeNbfSVB/6p/72XAZM9IPFx0
	FT/YmijkLUXeLXxolNT1sQev6o7X9RLE5EGymSu57K7MGOTNPmOcXkXD2yl6TIQvvG70bLBtYnR
	QrVaELr5aJPWXkPa0Fip+Td4IU3eAbMOsF6UAJPJ/r3lDx7OELGNC7Wvx1fox3LGrxbqKtLHbIc
	at2Syrw=
X-Received: by 2002:a05:6102:2ad1:b0:605:b96a:a0d4 with SMTP id
 ada2fe7eead31-60a0167fd81mr6134389137.27.1776166001643; Tue, 14 Apr 2026
 04:26:41 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <LV2PR21MB6760DEE956E328854F20CE6BA650A@LV2PR21MB6760.namprd21.prod.outlook.com>
 <91704f59fe5c3ab763927f66b6582d32975a1764.camel@codeconstruct.com.au>
 <DS0SPRMB0144E17B9D846259CD076C54A65AA@DS0SPRMB0144.namprd21.prod.outlook.com>
 <LV2PR21MB676012961B86F8E3884F65E2A6242@LV2PR21MB6760.namprd21.prod.outlook.com>
In-Reply-To: <LV2PR21MB676012961B86F8E3884F65E2A6242@LV2PR21MB6760.namprd21.prod.outlook.com>
From: Ratan Gupta <ratankgupta31@gmail.com>
Date: Tue, 14 Apr 2026 16:56:30 +0530
X-Gm-Features: AQROBzDcw3DBarZ4WNajDdkIfWq9hRDyfM4gUplhUWzz_eE2PRHJFnj13c6HYo8
Message-ID: <CAMhqiMrd3zmG01=ZL8RxDEs6zcecJm1UoZErLWVhqAzOddYsRQ@mail.gmail.com>
Subject: Re: [RFC] SPDM attestation E2E findings from Renode testing
To: Gary Beihl <garybeihl@microsoft.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	Thirupathaiah Annapureddy <thiruan@microsoft.com>, Sagar Dharia <Sagar.Dharia@microsoft.com>, 
	Giri Mudusuru <girimudusuru@microsoft.com>, Matt Johnston <matt@codeconstruct.com.au>, 
	Chinmay Shripad Hegde <hosmanechinmay@gmail.com>, Archana Kakani <archana.kakani@ibm.com>, 
	Manjeet Singh <itsmanjeet1998@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009716a3064f69df00"

--0000000000009716a3064f69df00
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gary,

Thanks for highlighting the issues. Since most of the Gerrit commits are
still not merged, you can continue leaving comments on those. However, for
issue 2, you may go ahead and push the fix as that code has already been
merged.

As part of SPDM 1.1, the Challenge was optional - however, you can still
proceed with the change for Challenge handling if needed.

We should coordinate closely to ensure all commits are applied in a proper
sequence.
Thanks
Ratan


On Mon, Apr 13, 2026 at 9:40=E2=80=AFPM Gary Beihl <garybeihl@microsoft.com=
> wrote:

> (CC'ing the SPDM chain maintainers directly for visibility; posting to th=
e
> list so the discussion stays searchable alongside the April 2 thread.)
>
>
>
> Following up on the April 2 RFC [1] and Matt's reply [2]: I now have a
> group of six patches on a local branch that take the SPDM E2E suite
>
> from 0/13 to 17/17 passing on Renode evb-ast2600 (14 attestation scenario=
s
> + 1 boot + 2 new SPDMGetSignedMeasurements scenarios I added to cover the
> on-demand D-Bus path).
>
>
>
> I'd like input from the SPDM chain maintainers on how you'd prefer to
> receive these patches before I start pushing to Gerrit.
>
>
>
> Here are the 6 patches: All are small and independent. Each has a
> one-paragraph rationale in the commit message plus a "Tested:" trailer
> describing what the Renode E2E suite exercises.
>
>
>
> 1. spdmd: Handle missing MCTP endpoints gracefully -
> mctp_transport_discovery.cpp. Catches ResourceNotFound and per-endpoint
> query exceptions so spdmd doesn't terminate on a freshly booted system wi=
th
> no MCTP endpoints yet configured. Same pattern as Archana's fix in 88794
> for the TCP discovery path.
>
>
>
> 2. spdmd: Search the full object tree in mapper lookups -
> utils/mapper.cpp. Changes get_sub_tree("/xyz/openbmc_project", ...) to
> get_sub_tree("/", ...) so the search finds mctpd-managed endpoints under
> /au/com/codeconstruct/mctp1/... =E2=80=94 mctpd implements both
> xyz.openbmc_project.MCTP.Endpoint and au.com.codeconstruct.MCTP.Endpoint1
> on the same object, but the xyz-rooted search never finds it.
>
>
>
> 3. spdmd: Remove unnecessary MCTP socket bind() - mctp_helper.hpp. This i=
s
> the fix Matt recommended in [2]. Removes the wildcard bind(ANY, ANY, SPDM=
,
> OWNER) that prevented multi-device discovery from working =E2=80=94 multi=
ple
> MctpIoClass instances would collide on the same bound tuple. spdmd is a
> pure synchronous requester so no bind() is needed. Same pattern as the
> pldmtool fix Matt referenced (openbmc/pldm 83626).
>
>
>
> 4. spdmd: Set MCTP socket receive timeout in mctp_helper.hpp. Adds
> SO_RCVTIMEO=3D10s at socket creation. The existing MctpIoClass::read() ma=
rks
> its timeout parameter as [[maybe_unused]] and recvfrom() blocks forever o=
n
> unreachable devices, so libspdm never returns LIBSPDM_STATUS_RECEIVE_FAIL
> and systemd's start-timeout kills spdmd before it becomes active.
>
>
>
> 5. spdmd: Implement eager SPDM attestation on discovery
> spdm_dbus_responder.cpp/hpp, spdmd.cpp. Adds a performEagerAttestation()
> method that runs VCA + GET_DIGESTS + GET_CERTIFICATE + CHALLENGE on every
> discovered device and updates the
> ComponentIntegrity.ResponderVerificationStatus D-Bus property. Called fro=
m
> main() after ctx.request_name() so attestation timing can't trigger
> systemd's TimeoutStartSec.
>
>
>
> CHALLENGE is the critical step for the security gap I mentioned in the
> original RFC =E2=80=94 without it, a wrong or compromised private key sti=
ll passes
> attestation because GET_CERTIFICATE alone does not prove key ownership.
>
>
>
> This is the commit I'm least sure about architecturally.
>
>
>
> Archana: I see 88873 adds an SPDMResponderManager with a
> connectSPDMDevice() stub. Would you rather I rebase the attestation logic
> into your manager class instead of adding it as a method on
> SPDMDBusResponder? Happy to do either.
>
>
>
> 6. spdmd: Surface SPDMGetSignedMeasurements errors
> component_integrity_dbus.cpp. The catch block in method_call() currently
> swallows all std::exception subtypes and returns a tuple of empty strings
> as if the call had succeeded, so bmcweb returns HTTP 200 with
> "SignedMeasurements":"" on any libspdm failure. Fix is to split the catch=
:
> sdbusplus::exception::exception subtypes are rethrown (preserving
> InvalidArgument), generic std::exception is converted to InternalFailure.
> Bmcweb then maps the D-Bus error to HTTP 500 with a Redfish
> @Message.ExtendedInfo body.
>
>
>
> TCP discovery exception handling =E2=80=94 I had also fixed the TCP
> ResourceNotFound crash, but then noticed Archana's 88794 already does thi=
s.
> So that one's dropped from my stack.
>
>
>
> ## Questions for the chain maintainers
>
>
>
> The chain I'm targeting is NVIDIA's (80262, 80355, 80264, 80272, 80311,
> 80358, 84019, ...) since my fixes touch files that only exist there. I
> understand the IBM chain (88112, 88124, 88873, 88794, 89179) is a paralle=
l
> track =E2=80=94 fixes 1-4 and 6 are on files IBM's chain doesn't touch, a=
nd fix 5
> will need to be reconciled once the two chains merge.
>
>
>
> Before I start pushing, could you let me know:
>
>
>
>   a) Are you okay with fixes 1, 2, 3, 4, and 6 landing as a five-commit
> stack on Gerrit depending on the NVIDIA chain (specifically 80262 PS19,
> 80355, and 84019)? I'd submit them under my Microsoft email and reference
> the April 2 RFC in each commit message.
>
>
>
>   b) For fix 5 (eager attestation): does it make more sense to (i) post i=
t
> as a stand-alone Gerrit change stacked on 84019 now, and reconcile with
> 88873's SPDMResponderManager later, (ii) post it as an amendment to 88873
> that fills in the connectSPDMDevice() TODO, or (iii) hold until the NVIDI=
A
> and IBM chains converge upstream?
>
>
>
>   c) Is there a planned coordination point where the two chains merge? I
> see 88873 intends to drive NVIDIA's SpdmTransport eventually. Happy to he=
lp
> bridge them if that's a blocker for landing the attestation flow.
>
>
>
> If any of the six descriptions look off to you, please push back before I
> push them to Gerrit =E2=80=94 I'd rather have the discussion in email tha=
n after N
> patchsets back-and-forth.
>
>
>
> Full commit messages and diffs are on a local branch; I can either (a)
> upload to Gerrit as a draft and share links, (b) post patches inline to t=
he
> list as a v1 series, or (c) share them privately if you'd prefer. Let me
> know which you'd like.
>
>
>
> Thanks,
>
> Gary
>
>
>
> [1] https://lists.ozlabs.org/pipermail/openbmc/2026-April/038553.html
>
> [2] https://lists.ozlabs.org/pipermail/openbmc/2026-April/038554.html
>
>
>
> *From:* Gary Beihl <garybeihl@microsoft.com>
> *Sent:* Tuesday, April 7, 2026 4:51 PM
> *To:* Matt Johnston <matt@codeconstruct.com.au>; openbmc@lists.ozlabs.org
> *Cc:* Thirupathaiah Annapureddy <thiruan@microsoft.com>; Sagar Dharia <
> Sagar.Dharia@microsoft.com>; Giri Mudusuru <girimudusuru@microsoft.com>
> *Subject:* RE: [EXTERNAL] Re: [RFC] SPDM attestation E2E findings from
> Renode testing
>
>
>
> Hi Matt,
>
>
>
> Thank you for the recommendation =E2=80=93 I followed your suggestion and=
 dropped
> the call to bind() altogether. Since spdmd only does request/response (no
> async SPDM messages), regular sendto()/recvfrom() with SO_RCVTIMEO) works
> just fine. Each endpoint gets its own socket with no EADDRINUSE conflict.
>
>
>
> All 14 SPDM E2E Robot Framework tests continue to pass with this change,
> including the multi-endpoint scenarios that previously hit EADDRINUSE.
>
>
>
> Per-endpoint bind() from Linux 6.17 is good to know about for future work
> in case we need to handle async SPDM notifications (e.g, KEY_UPDATE).
>
>
>
> Thanks,
>
> Gary
>
>
>
>
>
> *From:* Matt Johnston <matt@codeconstruct.com.au>
> *Sent:* Wednesday, April 1, 2026 10:09 PM
> *To:* Gary Beihl <garybeihl@microsoft.com>; openbmc@lists.ozlabs.org
> *Cc:* Thirupathaiah Annapureddy <thiruan@microsoft.com>; Sagar Dharia <
> Sagar.Dharia@microsoft.com>; Giri Mudusuru <girimudusuru@microsoft.com>
> *Subject:* [EXTERNAL] Re: [RFC] SPDM attestation E2E findings from Renode
> testing
>
>
>
> You don't often get email from matt@codeconstruct.com.au. Learn why this
> is important <https://aka.ms/LearnAboutSenderIdentification>
>
> Hi Gary,
>
>
>
> On Wed, 2026-04-01 at 21:35 +0000, Gary Beihl wrote:
>
> (c) Shared AF_MCTP socket (affects 80311: mctp_helper.hpp)
>
>
>
> Only one socket can bind to (MCTP_ADDR_ANY, MCTP_TYPE_SPDM).  When spdmd
> attests multiple endpoints sequentially, the second
>   MctpIoClass::createSocket() fails with EADDRINUSE. The fix is a
> process-lifetime shared socket (singleton pattern), draining stale
> responses between endpoint attestations with recv(MSG_DONTWAIT).
>
>
>
> Since Linux 6.17 it is possible to restrict a bind() to only receive from
> a single remote endpoint [1]. Call connect() with the remote address befo=
re
> the bind().
>
>
>
> Is the SPDM implementation using asynchronous messages sent by the
> responder? (KEY_UPDATE, HEARTBEAT, END_SESSION)
>
> If not, I think the bind() could be removed altogether.
>
> bind() isn't needed in the case where the Linux host is performing a plai=
n
> send() then receiving a response. A similar situation was fixed in pldmto=
ol
> [2].
>
>
>
> [1]
> https://lore.kernel.org/all/20250710-mctp-bind-v4-6-8ec2f6460c56@codecons=
truct.com.au/
>
> [2] https://gerrit.openbmc.org/c/openbmc/pldm/+/83626
>
>
>
> Cheers,
>
> Matt
>
>
>

--0000000000009716a3064f69df00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Hi Gary,</p><p>Thanks for highlighting the issues. Sinc=
e most of the Gerrit commits are still not merged, you can continue leaving=
 comments on those. However, for issue 2, you may go ahead and push the fix=
 as that code has already been merged.</p>
<p>As part of SPDM 1.1, the Challenge was optional - however, you can still=
 proceed with the change for Challenge handling if needed.</p>
<p>We should coordinate closely to ensure all commits are applied in a prop=
er sequence.</p><div>Thanks</div><div>Ratan</div><div><br></div></div><br><=
div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"g=
mail_attr">On Mon, Apr 13, 2026 at 9:40=E2=80=AFPM Gary Beihl &lt;<a href=
=3D"mailto:garybeihl@microsoft.com">garybeihl@microsoft.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"ms=
g8586052932577486402">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_8586052932577486402WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">(CC&#39;ing the SPDM =
chain maintainers directly for visibility; posting to the list so the discu=
ssion stays searchable alongside the April 2 thread.)<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Following up on the A=
pril 2 RFC [1] and Matt&#39;s reply [2]: I now have a group of six patches =
on a local branch that take the SPDM E2E suite<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">from 0/13 to 17/17 pa=
ssing on Renode evb-ast2600 (14 attestation scenarios + 1 boot + 2 new SPDM=
GetSignedMeasurements scenarios I added to cover the on-demand D-Bus path).=
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">I&#39;d like input fr=
om the SPDM chain maintainers on how you&#39;d prefer to receive these patc=
hes before I start pushing to Gerrit.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Here are the 6 patche=
s: All are small and independent. Each has a one-paragraph rationale in the=
 commit message plus a &quot;Tested:&quot; trailer describing what the Reno=
de E2E suite exercises.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">1. spdmd: Handle miss=
ing MCTP endpoints gracefully - mctp_transport_discovery.cpp. Catches Resou=
rceNotFound and per-endpoint query exceptions so spdmd doesn&#39;t terminat=
e on a freshly booted system with no MCTP
 endpoints yet configured. Same pattern as Archana&#39;s fix in 88794 for t=
he TCP discovery path.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">2. spdmd: Search the =
full object tree in mapper lookups - utils/mapper.cpp. Changes get_sub_tree=
(&quot;/xyz/openbmc_project&quot;, ...) to get_sub_tree(&quot;/&quot;, ...)=
 so the search finds mctpd-managed endpoints under /au/com/codeconstruct/mc=
tp1/...
 =E2=80=94 mctpd implements both xyz.openbmc_project.MCTP.Endpoint and au.c=
om.codeconstruct.MCTP.Endpoint1 on the same object, but the xyz-rooted sear=
ch never finds it.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">3. spdmd: Remove unne=
cessary MCTP socket bind() - mctp_helper.hpp. This is the fix Matt recommen=
ded in [2]. Removes the wildcard bind(ANY, ANY, SPDM, OWNER) that prevented=
 multi-device discovery from working
 =E2=80=94 multiple MctpIoClass instances would collide on the same bound t=
uple. spdmd is a pure synchronous requester so no bind() is needed. Same pa=
ttern as the pldmtool fix Matt referenced (openbmc/pldm 83626).<u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">4. spdmd: Set MCTP so=
cket receive timeout in mctp_helper.hpp. Adds SO_RCVTIMEO=3D10s at socket c=
reation. The existing MctpIoClass::read() marks its timeout parameter as [[=
maybe_unused]] and recvfrom() blocks
 forever on unreachable devices, so libspdm never returns LIBSPDM_STATUS_RE=
CEIVE_FAIL and systemd&#39;s start-timeout kills spdmd before it becomes ac=
tive.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">5. spdmd: Implement e=
ager SPDM attestation on discovery spdm_dbus_responder.cpp/hpp, spdmd.cpp. =
Adds a performEagerAttestation() method that runs VCA + GET_DIGESTS + GET_C=
ERTIFICATE + CHALLENGE on every discovered
 device and updates the ComponentIntegrity.ResponderVerificationStatus D-Bu=
s property. Called from main() after ctx.request_name() so attestation timi=
ng can&#39;t trigger systemd&#39;s TimeoutStartSec.<u></u><u></u></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">CHALLENGE is the crit=
ical step for the security gap I mentioned in the original RFC =E2=80=94 wi=
thout it, a wrong or compromised private key still passes attestation becau=
se GET_CERTIFICATE alone does not prove key
 ownership.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">This is the commit I&=
#39;m least sure about architecturally.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Archana: I see 88873 =
adds an SPDMResponderManager with a connectSPDMDevice() stub. Would you rat=
her I rebase the attestation logic into your manager class instead of addin=
g it as a method on SPDMDBusResponder?
 Happy to do either.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">6. spdmd: Surface SPD=
MGetSignedMeasurements errors component_integrity_dbus.cpp. The catch block=
 in method_call() currently swallows all std::exception subtypes and return=
s a tuple of empty strings as if the
 call had succeeded, so bmcweb returns HTTP 200 with &quot;SignedMeasuremen=
ts&quot;:&quot;&quot; on any libspdm failure. Fix is to split the catch: sd=
busplus::exception::exception subtypes are rethrown (preserving InvalidArgu=
ment), generic std::exception is converted to InternalFailure.
 Bmcweb then maps the D-Bus error to HTTP 500 with a Redfish @Message.Exten=
dedInfo body.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">TCP discovery excepti=
on handling =E2=80=94 I had also fixed the TCP ResourceNotFound crash, but =
then noticed Archana&#39;s 88794 already does this. So that one&#39;s dropp=
ed from my stack.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">## Questions for the =
chain maintainers<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">The chain I&#39;m tar=
geting is NVIDIA&#39;s (80262, 80355, 80264, 80272, 80311, 80358, 84019, ..=
.) since my fixes touch files that only exist there. I understand the IBM c=
hain (88112, 88124, 88873, 88794, 89179) is
 a parallel track =E2=80=94 fixes 1-4 and 6 are on files IBM&#39;s chain do=
esn&#39;t touch, and fix 5 will need to be reconciled once the two chains m=
erge.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Before I start pushin=
g, could you let me know:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0 a) Are you oka=
y with fixes 1, 2, 3, 4, and 6 landing as a five-commit stack on Gerrit dep=
ending on the NVIDIA chain (specifically 80262 PS19, 80355, and 84019)? I&#=
39;d submit them under my Microsoft email and
 reference the April 2 RFC in each commit message.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0 b) For fix 5 (=
eager attestation): does it make more sense to (i) post it as a stand-alone=
 Gerrit change stacked on 84019 now, and reconcile with 88873&#39;s SPDMRes=
ponderManager later, (ii) post it as an amendment
 to 88873 that fills in the connectSPDMDevice() TODO, or (iii) hold until t=
he NVIDIA and IBM chains converge upstream?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0 c) Is there a =
planned coordination point where the two chains merge? I see 88873 intends =
to drive NVIDIA&#39;s SpdmTransport eventually. Happy to help bridge them i=
f that&#39;s a blocker for landing the attestation
 flow.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">If any of the six des=
criptions look off to you, please push back before I push them to Gerrit =
=E2=80=94 I&#39;d rather have the discussion in email than after N patchset=
s back-and-forth.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Full commit messages =
and diffs are on a local branch; I can either (a) upload to Gerrit as a dra=
ft and share links, (b) post patches inline to the list as a v1 series, or =
(c) share them privately if you&#39;d
 prefer. Let me know which you&#39;d like.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Thanks,<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Gary<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">[1] <a href=3D"https:=
//lists.ozlabs.org/pipermail/openbmc/2026-April/038553.html" target=3D"_bla=
nk">
https://lists.ozlabs.org/pipermail/openbmc/2026-April/038553.html</a><u></u=
><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">[2] <a href=3D"https:=
//lists.ozlabs.org/pipermail/openbmc/2026-April/038554.html" target=3D"_bla=
nk">
https://lists.ozlabs.org/pipermail/openbmc/2026-April/038554.html</a><u></u=
><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:Calibri=
,sans-serif">From:</span></b><span style=3D"font-size:11pt;font-family:Cali=
bri,sans-serif"> Gary Beihl &lt;<a href=3D"mailto:garybeihl@microsoft.com" =
target=3D"_blank">garybeihl@microsoft.com</a>&gt;
<br>
<b>Sent:</b> Tuesday, April 7, 2026 4:51 PM<br>
<b>To:</b> Matt Johnston &lt;<a href=3D"mailto:matt@codeconstruct.com.au" t=
arget=3D"_blank">matt@codeconstruct.com.au</a>&gt;; <a href=3D"mailto:openb=
mc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a><br>
<b>Cc:</b> Thirupathaiah Annapureddy &lt;<a href=3D"mailto:thiruan@microsof=
t.com" target=3D"_blank">thiruan@microsoft.com</a>&gt;; Sagar Dharia &lt;<a=
 href=3D"mailto:Sagar.Dharia@microsoft.com" target=3D"_blank">Sagar.Dharia@=
microsoft.com</a>&gt;; Giri Mudusuru &lt;<a href=3D"mailto:girimudusuru@mic=
rosoft.com" target=3D"_blank">girimudusuru@microsoft.com</a>&gt;<br>
<b>Subject:</b> RE: [EXTERNAL] Re: [RFC] SPDM attestation E2E findings from=
 Renode testing<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Hi Matt,<u></u><u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Thank you for the rec=
ommendation =E2=80=93 I followed your suggestion and dropped the call to bi=
nd() altogether. Since spdmd only does request/response (no async SPDM mess=
ages), regular sendto()/recvfrom() with SO_RCVTIMEO)
 works just fine. Each endpoint gets its own socket with no EADDRINUSE conf=
lict.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">All 14 SPDM E2E Robot=
 Framework tests continue to pass with this change, including the multi-end=
point scenarios that previously hit EADDRINUSE.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Per-endpoint bind() f=
rom Linux 6.17 is good to know about for future work in case we need to han=
dle async SPDM notifications (e.g, KEY_UPDATE).<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Thanks,<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Gary<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:Calibri=
,sans-serif">From:</span></b><span style=3D"font-size:11pt;font-family:Cali=
bri,sans-serif"> Matt Johnston &lt;<a href=3D"mailto:matt@codeconstruct.com=
.au" target=3D"_blank">matt@codeconstruct.com.au</a>&gt;
<br>
<b>Sent:</b> Wednesday, April 1, 2026 10:09 PM<br>
<b>To:</b> Gary Beihl &lt;<a href=3D"mailto:garybeihl@microsoft.com" target=
=3D"_blank">garybeihl@microsoft.com</a>&gt;;
<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists=
.ozlabs.org</a><br>
<b>Cc:</b> Thirupathaiah Annapureddy &lt;<a href=3D"mailto:thiruan@microsof=
t.com" target=3D"_blank">thiruan@microsoft.com</a>&gt;; Sagar Dharia &lt;<a=
 href=3D"mailto:Sagar.Dharia@microsoft.com" target=3D"_blank">Sagar.Dharia@=
microsoft.com</a>&gt;; Giri Mudusuru &lt;<a href=3D"mailto:girimudusuru@mic=
rosoft.com" target=3D"_blank">girimudusuru@microsoft.com</a>&gt;<br>
<b>Subject:</b> [EXTERNAL] Re: [RFC] SPDM attestation E2E findings from Ren=
ode testing<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"left" widt=
h=3D"100%" style=3D"width:100%">
<tbody>
<tr>
<td width=3D"0" style=3D"width:0.3pt;background:rgb(166,166,166);padding:5.=
25pt 1.5pt">
</td>
<td width=3D"100%" style=3D"background:revert;border:revert;color:revert;di=
rection:revert;display:revert;font-size:revert;height:revert;letter-spacing=
:revert;line-height:revert;margin:revert;opacity:revert;outline:revert;over=
flow:revert;padding:revert;table-layout:revert;text-align:revert;text-inden=
t:revert;text-orientation:revert;text-overflow:revert;text-transform:revert=
;vertical-align:revert;white-space:revert;width:revert;word-break:revert;wo=
rd-spacing:revert;writing-mode:revert;zoom:revert">
<div>
<p class=3D"MsoNormal">
<span style=3D"font-size:9pt;font-family:&quot;Segoe UI&quot;,sans-serif;co=
lor:rgb(33,33,33)">You don&#39;t often get email from
<a href=3D"mailto:matt@codeconstruct.com.au" target=3D"_blank">matt@codecon=
struct.com.au</a>. <a href=3D"https://aka.ms/LearnAboutSenderIdentification=
" target=3D"_blank">
Learn why this is important</a> <u></u><u></u></span></p>
</div>
</td>
<td width=3D"75" style=3D"background:revert;border:revert;color:revert;dire=
ction:revert;display:revert;font-size:revert;height:revert;letter-spacing:r=
evert;line-height:revert;margin:revert;opacity:revert;outline:revert;overfl=
ow:revert;padding:revert;table-layout:revert;text-align:revert;text-indent:=
revert;text-orientation:revert;text-overflow:revert;text-transform:revert;v=
ertical-align:revert;white-space:revert;width:revert;word-break:revert;word=
-spacing:revert;writing-mode:revert;zoom:revert">
</td>
</tr>
</tbody>
</table>
<div>
<div>
<p class=3D"MsoNormal"><span>Hi Gary,<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span>On Wed, 2026-04-01 at 21:35 +0000, Gary Beihl =
wrote:<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1.5pt solid rgb(114,159,207);padding:0in 0in 0in 6pt;margin:5pt =
0in 5pt 4.8pt">
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">(c) Shared AF_MCTP so=
cket (affects 80311: mctp_helper.hpp)</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0</span><u></u><=
u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Only one socket can b=
ind to (MCTP_ADDR_ANY, MCTP_TYPE_SPDM).=C2=A0 When spdmd attests multiple e=
ndpoints sequentially, the second =C2=A0=C2=A0MctpIoClass::createSocket() f=
ails with EADDRINUSE. The fix is a process-lifetime
 shared socket (singleton pattern), draining stale responses between endpoi=
nt attestations with recv(MSG_DONTWAIT).</span><u></u><u></u></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><span><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span>Since Linux 6.17 it is possible to restrict a =
bind() to only receive from a single remote endpoint [1]. Call connect() wi=
th the remote address before the bind().<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span>Is the SPDM implementation using asynchronous =
messages sent by the responder? (KEY_UPDATE, HEARTBEAT, END_SESSION)<u></u>=
<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span>If not, I think the bind() could be removed al=
together.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span>bind() isn&#39;t needed in the case where the =
Linux host is performing a plain send() then receiving a response. A simila=
r situation was fixed in pldmtool [2].<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span>[1]=C2=A0<a href=3D"https://lore.kernel.org/al=
l/20250710-mctp-bind-v4-6-8ec2f6460c56@codeconstruct.com.au/" target=3D"_bl=
ank">https://lore.kernel.org/all/20250710-mctp-bind-v4-6-8ec2f6460c56@codec=
onstruct.com.au/</a><u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span>[2]=C2=A0<a href=3D"https://gerrit.openbmc.org=
/c/openbmc/pldm/+/83626" target=3D"_blank">https://gerrit.openbmc.org/c/ope=
nbmc/pldm/+/83626</a>=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span>Cheers,<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span>Matt<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span><u></u>=C2=A0<u></u></span></p>
</div>
</div>
</div>
</div>

</div></blockquote></div>

--0000000000009716a3064f69df00--


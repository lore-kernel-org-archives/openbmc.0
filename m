Return-Path: <openbmc+bounces-2388-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F3DC5AD2C
	for <openbmc@archiver.kernel.org>; Sun,  9 Aug 2026 02:59:41 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hHjKN4SmDz2ykn;
	Sun, 09 Aug 2026 12:59:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::102a" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1786121781;
	cv=pass; b=gw3dO5LSTkxU1K+GAc82K3gksib0gLjEt1AcyBdSfq5hrV9IXkGRPoF+mpFB39y14MJwXzY0maOS2zg58b6epu4qzfyNMeuCsxq10iDJtJats9YwvYLaDLRiKxhAuhE2ylpMES/Zn/FsrizXkskvqI5JCi5u4Zh+aLtYOfeeMuOUzcPkgTbj4DcAuatGl3SeclwoZjBinZq6a+9/fiu0f3GmjoO479jd8WU8TTlrku55WKKmg5q2aKmff8xMTPkBmsBrpTOqce8TAglNdTYidZncfeiy02VFrniTWBKQnvwx38g2faOUhtwZT46d7vN9Y+cKVJ30Bg8UADJuKfdq4w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1786121781; c=relaxed/relaxed;
	bh=TPqOnTi8pJ/1gSqGBjuspWdICGbqHxixv0M1WZDKr+c=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=aW3IvCFe398yjF9+igyWwE3SV5UJLrBbcrzdIFiq3Z+pxOCaTgw6my7sq0STz9KmwPM/hbfG/ix8Yvt9O5VJotoTaPzPoo6+6VKqDFWUK2ZI7WzxCrf744DgQ3VBEbz3A2lTFoNiDcl4z3CbJJfdVqVvYWN+NSf6ZE2T2CfL+Ro/GOPCk/kRX/7Vzyj8N+kAl5jD6ngyMq/W0hHfWSjl39VYL3AjsaIe0BWr6fBQpBXM2ehxb6BH2RDSilcfSCQzXO0yyPMfZyarUhF/zKLpjUpm2wQkQ2Mcyv++yS441SNhTPxs7NSWxg/AKz7mgI7OyRwTBPvEnAsJv1pKQ72mzQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rfQaIjM2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=gmbeihl@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rfQaIjM2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=gmbeihl@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hGqzl568yz3c78
	for <openbmc@lists.ozlabs.org>; Sat, 08 Aug 2026 02:56:18 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so3163954a91.2
        for <openbmc@lists.ozlabs.org>; Fri, 07 Aug 2026 09:56:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786121776; cv=none;
        d=google.com; s=arc-20260327;
        b=L3tIOlq8aHAx9c/qMI5u2WYRhcwoGBejfRhSXPr1qw0uZsTqgKmz/upE/r8RBg35f+
         QQQp0WAtwZtehrRvuqKQF/TWGgvhOsHZBurPkaxv/XZqA1FjjTBk+muyReiu7NShzjY+
         tkOJ3ulHPAI4Vajo96p2hp5uQIeuXzsOCzv8FVrhQ5d3q1X+9feCJI4Y/byruSDsHcV1
         v/9AQVHdhSkdA1KExyNvxfLi8KATddAHjWgTmeLVE/nXFgc2A3MFkSgkkY0xcQBFhSxa
         HR2wEl9IRplG/941xOjFP8Khl0ygrkDPZDUK8gkda0Eab/eRvrmgT5sefvN3sux2U1lp
         SDWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=TPqOnTi8pJ/1gSqGBjuspWdICGbqHxixv0M1WZDKr+c=;
        fh=B5hptedw+6RyGR/i2ArH91xOt8ZhRewMTnM2T7RVmak=;
        b=hrrMNTRKbcGdrx4rcyEVVYbR/P4/cr5q2NCS8Tg78PJ/CKMOZAZeXKomhzjqsijc/z
         p5sRZQjLE9p2i+ngS5knaFomcCJGSBdG2sA09uO8iQ/UVBHQyMQrvxW4NSNiXlMluSZ+
         XQMok6JIH/DOaM98JcWv2QjWLXCKvArvY5Ik84JDWor1ExJw0aJgfDguHIsmfUK9GrcN
         ahEu4Rzise3PwD4hE8vaA1qBDj2k1BzD7UytCGw7Mk04WvYe8U0gsZot3dds19EeqKfd
         DjNmQXdzTsbBnFdKCij4wU4/IBZgBEt7zoLscRIoCe+nbOzdI9Mxl1oDVJZaDnKAGkKo
         3hWQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786121776; x=1786726576; darn=lists.ozlabs.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TPqOnTi8pJ/1gSqGBjuspWdICGbqHxixv0M1WZDKr+c=;
        b=rfQaIjM2QcFwpLLSD/VeTupwDfwbRGk1jPTF/VDhSKHG4QdFgach4a6qdaQ8VV4FpS
         tX0Dry8/FfQNBB/sPO935QytIQVaacrouRZiK5vgRydo/tO9Hj6V6c5QYVgd9G2aXHWn
         8w6/MF67GsWCvEnRnnczYT5/BWy7569FmYjq4J+DCpAbYDcg8p690CuWXMTaoAmKPolL
         fRtV3acB2Z3lfUm2H8OAIqxbmR5LNW2a0trXM92TnSLkyzy2MsEvUXgQ1QeokZ24VOR4
         IfL3U9CnCale9Tkg2c50AWu1LQbIbRfpo5jxP1i/9jnj1hoC+EJak+Q8oDgT1L3roazo
         nJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786121776; x=1786726576;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TPqOnTi8pJ/1gSqGBjuspWdICGbqHxixv0M1WZDKr+c=;
        b=SdJF4jebAwzE3UY/AD98wo1r4Lj0zJeEq33tGdrAioHEZYvRuMSTKkkV/2uSOphwae
         kR3xptWa8zvi5xwc37fF/ib8ISGcaTFyoAV3JDec8mY5/LHLq6EKscbhA1gVFbypC7Jd
         uYDbN08PWu/hVDpEJLMkIJFYC1qT0+JaehlxiJI0wUbpLtSZ888aSSZhpa9xDtpFxHM3
         Ul3RYVCN8NJu0SU2nBEnGfHoJnRoCK2R6hy4sTn0VplzrlJlE0vmgjLlFvK0a/pvJZ3o
         kOQdl6nH3E2fEnAKQejdiwurAGt1Z/bncHE9vbANGcqbBwLx8z6JCFF3e0zQK13CbPU+
         LdDg==
X-Gm-Message-State: AOJu0YyQX4qofhtZhdD4lyvpGVhAIP4yS3KkjYIIMTwmjxBxpQPo5Uo1
	bDTXfcUJCnPaoYuCwD/9FTi0bofqmKzwAJg9i7+PX75aDoiFaGuPE3WHeAC7LeRApObzgiSx8Nj
	a0C8eUbBJe7qy6LCnt8RGFXulEgauOx/06Zus/tI=
X-Gm-Gg: AR+sD12WQVqDihS/armNFEpox2NOFbPg44lWXNy/U1wtpNp1lPhKiwWHfuPi6AMsr4N
	tVxNBXNHcIDX++EA0xTjPGZtvyDGSooKoAWWphcRP/rR8Hb3SyhHlXofIOpir3SUBPWJuQXRAlC
	UT5heANheltOcbu6GxfJ45ebHIIXatAvxJksLibOjVPhswHvPl9Q0Y7L8mPSyGoJEbS7Q9jsxcW
	ebXAFlz3iln5Vcxw/I8GqwBKXIXZmxlFc92AnK4cWF4vCgyjyN32Td3o49B3sVkdrlwXqUY9grS
	Yy0TzYhd/GGrsu8tYllBmYQsbiOzuCkHqADxy7gY4Ms+APUG0mmmGBRT668crhKfTsru/GaLhWK
	9JOge6go9Y5MwyYdvQFvnP3zTa5P2wcte6hI=
X-Received: by 2002:a17:90b:582e:b0:38e:485c:ebd3 with SMTP id
 98e67ed59e1d1-392823d97aamr1260705a91.15.1786121776027; Fri, 07 Aug 2026
 09:56:16 -0700 (PDT)
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
From: Gary Beihl <gmbeihl@gmail.com>
Date: Fri, 7 Aug 2026 12:56:04 -0400
X-Gm-Features: AUfX_mw-3vK5FVGG4dNiEFRNhGCA6l84OzjjpiPWC99-A2a7KRlsptSX1UXvkyU
Message-ID: <CACtoqbdiodtucTtKVVx75e7Am=T_UyTS5+6LMxNFdNGpJ+vFjQ@mail.gmail.com>
Subject: RFC: gNMI/OpenConfig telemetry target for OpenBMC
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000fc5bdd065877e18e"

--000000000000fc5bdd065877e18e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'd like to gauge interest in adding a gNMI (gRPC Network Management
Interface) / OpenConfig telemetry target to OpenBMC, and get early feedback
on the approach before investing in a formal design review.

Motivation: OpenBMC exposes platform telemetry through Redfish today =E2=80=
=94 the
`openbmc/telemetry` service aggregates D-Bus sensor readings into
MetricReports, and bmcweb presents them via the Redfish TelemetryService
(with optional push over EventService/SSE). That path grew out of the
"Telemetry Streaming from OpenBMC" discussion back in 2019 (
https://lists.ozlabs.org/pipermail/openbmc/2019-October/019058.html); this
proposal builds on it rather than competing with it. Operators running BMCs
at fleet scale increasingly standardize their collection plane on gNMI with
OpenConfig models =E2=80=94 a single streaming-telemetry protocol already u=
sed
across their networking and, increasingly, their server and accelerator
estate. For those operators a Redfish-only BMC is a second-class telemetry
source: it must be polled per-endpoint rather than streamed, and it doesn't
speak the OpenConfig path/model vocabulary their collectors already
consume. There's no gNMI target in upstream OpenBMC today =E2=80=94 and not=
ably,
even Google (which originated gNMI) ships its upstream BMC telemetry as the
Nemora post-daemon and IPMI metric blobs (`google-misc`), not a gNMI face.

The footprint question, up front. I'm aware the usual (and reasonable)
objection to gNMI in OpenBMC is the weight of the gRPC + protobuf
dependency =E2=80=94 that's why it isn't already here. The proposal is desi=
gned
around that: the entire target, and its gRPC dependency chain, is opt-in
behind a meson feature (default disabled). With the feature off, no gRPC is
pulled and the default image is byte-for-byte unchanged. A BMC only pays
for it if a platform explicitly enables it.

Prior art: gRPC has been proposed in an OpenBMC repo before =E2=80=94 a gRP=
C
transport for `smbios-mdr` (2023, gerrit 65049) built and passed CI, but
was abandoned in late 2025 with the author's note that it "never passed
upstream review." I read that as gRPC changes struggling to attract
reviewer buy-in absent a maintainer champion, more than a hard policy veto
=E2=80=94 which is exactly why I'm leading with the footprint contract and =
gauging
interest here first, rather than just posting patches.

The approach: a second northbound face, not a new telemetry engine. The
target subscribes to the same `openbmc/telemetry` MetricReports over D-Bus
and streams them via gNMI Subscribe (STREAM SAMPLE/ON_CHANGE, POLL, ONCE)
on OpenConfig paths, over mutual-TLS reusing the BMC certificate store.
There's no new sensor-collection path =E2=80=94 if a value isn't already on=
 D-Bus,
it isn't exposed. So it's "one source of truth, two northbound faces:
Redfish (pull) and gNMI (streaming push)." For images that don't run the
telemetry aggregator, the bridge can also source directly from
`xyz.openbmc_project.Sensor.Value` objects (the same D-Bus data
`openbmc/telemetry` would aggregate) =E2=80=94 MetricReports stays the prim=
ary
path; this just avoids a hard dependency on the aggregator being present.

Status: I have a working prototype (C++ / sdbusplus / gRPC) that streams
end-to-end =E2=80=94 Capabilities + Subscribe verified with a gNMI client. =
I've
validated it against an emulated BMC: an AST2600 OpenBMC booted in a
deterministic full-system simulator, with a modeled LM75 temperature sensor
surfacing on D-Bus via phosphor-hwmon; the target runs in-guest, subscribes
to that sensor, and streams it to an in-guest gNMI client as a live
Subscribe (STREAM/SAMPLE) update on the OpenConfig path
/components/component[name=3Dambient]/state/temperature/instant =E2=80=94 a=
 real
sensor value, traced from the modeled device through to the gNMI update, no
synthetic feed. It's a prototype, not production, and hasn't yet run
against a physical BMC. A design write-up in the OpenBMC design-doc format
is in the repo:

  https://github.com/garybeihl/telemetry-gnmi   (docs/DESIGN.md)

What I'm asking:
1. Is there interest in a gNMI northbound upstream, given the
opt-in-footprint framing?
2. Feedback on the feature-gating approach =E2=80=94 is "default-disabled m=
eson
feature, image unchanged when off" the right contract, or is even an
optional gRPC dependency a concern?
3. Where should this live =E2=80=94 a new repository, and would anyone from=
 the
telemetry subproject be willing to weigh in?
4. Beyond the abandoned `smbios-mdr` gRPC transport, any prior art or
in-flight work I've missed =E2=80=94 and whether a well-gated, clearly-scop=
ed
telemetry face could get the reviewer engagement that earlier gRPC work
didn't.

If there's interest, I'll follow up with a formal design-doc review via
gerrit.

Thanks,
Gary Beihl
gmbeihl@gmail.com

--000000000000fc5bdd065877e18e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<br><br>I&#39;d like to gauge interest in adding a =
gNMI (gRPC Network Management Interface) / OpenConfig telemetry target to O=
penBMC, and get early feedback on the approach before investing in a formal=
 design review.<br><br>Motivation: OpenBMC exposes platform telemetry throu=
gh Redfish today =E2=80=94 the `openbmc/telemetry` service aggregates D-Bus=
 sensor readings into MetricReports, and bmcweb presents them via the Redfi=
sh TelemetryService (with optional push over EventService/SSE). That path g=
rew out of the &quot;Telemetry Streaming from OpenBMC&quot; discussion back=
 in 2019 (<a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2019-Octobe=
r/019058.html">https://lists.ozlabs.org/pipermail/openbmc/2019-October/0190=
58.html</a>); this proposal builds on it rather than competing with it. Ope=
rators running BMCs at fleet scale increasingly standardize their collectio=
n plane on gNMI with OpenConfig models =E2=80=94 a single streaming-telemet=
ry protocol already used across their networking and, increasingly, their s=
erver and accelerator estate. For those operators a Redfish-only BMC is a s=
econd-class telemetry source: it must be polled per-endpoint rather than st=
reamed, and it doesn&#39;t speak the OpenConfig path/model vocabulary their=
 collectors already consume. There&#39;s no gNMI target in upstream OpenBMC=
 today =E2=80=94 and notably, even Google (which originated gNMI) ships its=
 upstream BMC telemetry as the Nemora post-daemon and IPMI metric blobs (`g=
oogle-misc`), not a gNMI face.<br><br>The footprint question, up front. I&#=
39;m aware the usual (and reasonable) objection to gNMI in OpenBMC is the w=
eight of the gRPC + protobuf dependency =E2=80=94 that&#39;s why it isn&#39=
;t already here. The proposal is designed around that: the entire target, a=
nd its gRPC dependency chain, is opt-in behind a meson feature (default dis=
abled). With the feature off, no gRPC is pulled and the default image is by=
te-for-byte unchanged. A BMC only pays for it if a platform explicitly enab=
les it.<br><br>Prior art: gRPC has been proposed in an OpenBMC repo before =
=E2=80=94 a gRPC transport for `smbios-mdr` (2023, gerrit 65049) built and =
passed CI, but was abandoned in late 2025 with the author&#39;s note that i=
t &quot;never passed upstream review.&quot; I read that as gRPC changes str=
uggling to attract reviewer buy-in absent a maintainer champion, more than =
a hard policy veto =E2=80=94 which is exactly why I&#39;m leading with the =
footprint contract and gauging interest here first, rather than just postin=
g patches.<br><br>The approach: a second northbound face, not a new telemet=
ry engine. The target subscribes to the same `openbmc/telemetry` MetricRepo=
rts over D-Bus and streams them via gNMI Subscribe (STREAM SAMPLE/ON_CHANGE=
, POLL, ONCE) on OpenConfig paths, over mutual-TLS reusing the BMC certific=
ate store. There&#39;s no new sensor-collection path =E2=80=94 if a value i=
sn&#39;t already on D-Bus, it isn&#39;t exposed. So it&#39;s &quot;one sour=
ce of truth, two northbound faces: Redfish (pull) and gNMI (streaming push)=
.&quot; For images that don&#39;t run the telemetry aggregator, the bridge =
can also source directly from `xyz.openbmc_project.Sensor.Value` objects (t=
he same D-Bus data `openbmc/telemetry` would aggregate) =E2=80=94 MetricRep=
orts stays the primary path; this just avoids a hard dependency on the aggr=
egator being present.<br><br>Status: I have a working prototype (C++ / sdbu=
splus / gRPC) that streams end-to-end =E2=80=94 Capabilities + Subscribe ve=
rified with a gNMI client. I&#39;ve validated it against an emulated BMC: a=
n AST2600 OpenBMC booted in a deterministic full-system simulator, with a m=
odeled LM75 temperature sensor surfacing on D-Bus via phosphor-hwmon; the t=
arget runs in-guest, subscribes to that sensor, and streams it to an in-gue=
st gNMI client as a live Subscribe (STREAM/SAMPLE) update on the OpenConfig=
 path /components/component[name=3Dambient]/state/temperature/instant =E2=
=80=94 a real sensor value, traced from the modeled device through to the g=
NMI update, no synthetic feed. It&#39;s a prototype, not production, and ha=
sn&#39;t yet run against a physical BMC. A design write-up in the OpenBMC d=
esign-doc format is in the repo:<br><br>=C2=A0 <a href=3D"https://github.co=
m/garybeihl/telemetry-gnmi">https://github.com/garybeihl/telemetry-gnmi</a>=
 =C2=A0 (docs/DESIGN.md)<br><br>What I&#39;m asking:<br>1. Is there interes=
t in a gNMI northbound upstream, given the opt-in-footprint framing?<br>2. =
Feedback on the feature-gating approach =E2=80=94 is &quot;default-disabled=
 meson feature, image unchanged when off&quot; the right contract, or is ev=
en an optional gRPC dependency a concern?<br>3. Where should this live =E2=
=80=94 a new repository, and would anyone from the telemetry subproject be =
willing to weigh in?<br>4. Beyond the abandoned `smbios-mdr` gRPC transport=
, any prior art or in-flight work I&#39;ve missed =E2=80=94 and whether a w=
ell-gated, clearly-scoped telemetry face could get the reviewer engagement =
that earlier gRPC work didn&#39;t.<br><br>If there&#39;s interest, I&#39;ll=
 follow up with a formal design-doc review via gerrit.<br><br>Thanks,<br>Ga=
ry Beihl<br><a href=3D"mailto:gmbeihl@gmail.com">gmbeihl@gmail.com</a></div=
>

--000000000000fc5bdd065877e18e--


Return-Path: <openbmc+bounces-2003-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B8CCD5BC9
	for <openbmc@archiver.kernel.org>; Wed, 27 May 2026 23:58:07 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gQmlQ0P0nz2yTP;
	Thu, 28 May 2026 09:57:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.70.43.100
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779874113;
	cv=none; b=Mlt1jtEKwTbupkxpgQeYa/+vb+Eu5qDmyJjSxcx1JcIvJnGsSQI4pf5bhw348V12bzC42ZZfHoGJVXYLOxcfZ7D2rbxfeoZobxt2EpLiMCwQfpZQIPElnPtoaSKq94v9IEUdjpDcjU0SMye7z47D6m4KDQxxdQuU0X5ieukkZIP8YORsKMZSSdtAQGPNXc8ZKsz9NbSOyT6JWq/e93AOYUZqa6Xo4/KK3xxtGoFllFbC5UXt7pjSN2erSV6ky0jxPbyZWhQ77pwtpdtnMtV+z+v3cIPHwEgKhKI28Lgfnja91jrQWCWZd7Du/acuonEHVD9D0SplpnGWKlh4yOWk8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779874113; c=relaxed/relaxed;
	bh=nUxlzVO0HU7sMitHqLRSUqrgtoSDRzny2onb/ykYAt4=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bxMZw+7T7Wxz/bZzqTREv0pTpGtnM7erfOZBT6hIpmYMBhejgo0x8LYHBOvgQgi3DHqSD48G4AyBlu/5YpbnyJtyRovm+bEA7qxdgNZWJwEMZmZxR13dO0/Kdx8gHIxFES5oXIAMFw3UcrivBxuV8LTWQRuZCglPUwWacbA18DUZJpMiQzAPeM9nmW6lVR3rSXLMIqHF/D5DFCqsRNTuzHZl1+GAp0iYVo490CloVECP5Bnvw7Dgta8T30dmn0A4XtM8mWzF8I3ZVsrMfMmvVjIp/v5vsQCv3Vs500kilTNW10xgOkCXTuw9EFWYvcTcGt33ttHJDN/7DTulPrINPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail header.b=Lyf92kRV; dkim-atps=neutral; spf=pass (client-ip=185.70.43.100; helo=mail-43100.protonmail.ch; envelope-from=bobdabot@proton.me; receiver=lists.ozlabs.org) smtp.mailfrom=proton.me
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail header.b=Lyf92kRV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=proton.me (client-ip=185.70.43.100; helo=mail-43100.protonmail.ch; envelope-from=bobdabot@proton.me; receiver=lists.ozlabs.org)
Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gQPSF0HBfz2xBb
	for <openbmc@lists.ozlabs.org>; Wed, 27 May 2026 19:28:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1779874102; x=1780133302;
	bh=nUxlzVO0HU7sMitHqLRSUqrgtoSDRzny2onb/ykYAt4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Lyf92kRVQ0hfsSC/+5R8GenL3T05y8a42hNqXx8iDAYCpuvAk2I7GPxO4XjaZWr+Y
	 /BJ4Eo8GomQuwGJ1IC6ffjIWPLDAXnbFMqJApBzWcB2tEfzijHm1LFd0dWpklqMD3f
	 Fkbkb9rGKgF4DjwbodPsKnB8TjuA//WkJYlkinGDHMPAjTNKmWGbRS6H01T0HOMEZp
	 E5X6E5XcNaiz+eacSUQWJb1vTokaA3OG4cj3d+qHI4mzjZq8bJkLIzm8GDQBBh7RE5
	 tmyofr9RVh3YVhwAe0qEDYl8VeCZggJTz8/LdLCCDNTyI/n5EBSUOqPkUsZnk03LEJ
	 4UYaYoQXJcyyg==
Date: Wed, 27 May 2026 09:28:17 +0000
To: openbmc@lists.ozlabs.org
From: binreaper <bobdabot@proton.me>
Cc: Ed Tanous <ed@tanous.net>, Joseph Reynolds <joseph.reynolds1@ibm.com>, Gunnar Mills <gunnar@gmills.xyz>
Subject: bmcweb HTTP/2: unbounded request body accumulation before authentication
Message-ID: <jpYy_rQWOjeJJrLVapYy1VuFk7D3IeFfC6aFviq_lZz6FbXJTvPA8uPne4C1hqR9jYFTs-PFd2s16vpqj_4dCKz3JLwh4__9beqsHH42K_k=@proton.me>
Feedback-ID: 180516549:user:proton
X-Pm-Message-ID: 6fc6d09563984f71333e9e4a7ade55dcfcf7c150
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Posting to the public list per Ed Tanous's 2026-05-14 instruction that furt=
her correspondence on the bmcweb security findings I reported in February s=
hould go through public OpenBMC channels.

This is a public follow-up on one of the four findings I sent to openbmc-se=
curity@lists.ozlabs.org on 2026-02-23. It was acknowledged by Joseph Reynol=
ds, forwarded to the bmcweb maintainers, and bundled in the same email as t=
he H2 reserve-crash issue (which has since been patched on master as commit=
 `62526bb0`). The bundling appears to have been a mistake on my part =
=E2=80=94 this finding is a separate, more severe bug and did not receive a=
 Gerrit change or a fix on master. Posting it here now so it's on the recor=
d and any downstream consumer can patch.

A reproducer outline is included below; the reproducer itself is held back =
from the list per `openbmc-security` guidance and is available on request. =
A suggested Gerrit change will follow under separate cover.

## Summary

bmcweb's HTTP/2 request path accepts unlimited request body data from unaut=
henticated clients before authentication runs. The HTTP/1.1 path enforces a=
 4 KB unauthenticated body limit via Boost.Beast's parser; the HTTP/2 path =
has no equivalent enforcement. An unauthenticated client can open an h2 con=
nection, send a `POST`, and stream DATA frames until the BMC's single-threa=
ded event loop dies from out-of-memory.

- **Affected versions**: bmcweb on master as of 2026-05-14, all earlier ver=
sions with HTTP/2 enabled.
- **Configuration prerequisite**: `BMCWEB_EXPERIMENTAL_HTTP2` (or its curre=
nt equivalent) enabled at build time. HTTP/2 is the default protocol path v=
ia ALPN negotiation when enabled.
- **Severity**: I scored this CVSS 7.5 (`AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:=
H`), matching the severity Ed assigned to the related HTTP/1.1 `Expect: 100=
-continue` issue published as GHSA-p3gc-68x5-g9w3. This finding is in the s=
ame severity band and shares a root cause family.

## Code path

The HTTP/1.1 path inherits its body limit from Boost.Beast's parser, which =
is set per-request via `parse.body_limit(getContentLengthLimit())` in `http=
/http_connection.hpp`. The HTTP/2 path does not use Boost.Beast for body as=
sembly =E2=80=94 it uses `HttpBody::reader` directly (defined in `http/http=
_body.hpp`).

The relevant method on the reader is `put()`. Looking at its current implem=
entation on master (verified against commit `6a82fead`, 2026-05-19):

```
// http/http_body.hpp, around line 440
template <class ConstBufferSequence>
std::size_t put(const ConstBufferSequence& buffers,
                boost::system::error_code& ec)
{
    size_t extra =3D boost::beast::buffer_bytes(buffers);
    for (const auto b : boost::beast::buffers_range_ref(buffers))
    {
        const char* ptr =3D static_cast<const char*>(b.data());
        if (multipartParser) { /* parse-only, no size check */ }
        else { value.str().append(ptr, b.size()); }
    }
    ec =3D {};
    return extra;
}
```

`put()` appends incoming bytes to `value.str()` (a `std::string`) with **no=
 size check whatsoever**. There is no body-limit field on the reader, no pe=
r-stream byte counter that's compared against a maximum, and no early-rejec=
tion path. The function trusts the caller to bound the total. The multipart=
 branch is also unbounded =E2=80=94 it parses but doesn't reject on accumul=
ated size.

The caller in the HTTP/2 path is the nghttp2 DATA-frame callback in `http/h=
ttp2_connection.hpp` (the `onDataChunkRecvCallback` family). That callback =
forwards each chunk to `put()`. nghttp2 auto-replenishes flow-control windo=
ws by default; bmcweb does not set `nghttp2_option_set_no_auto_window_updat=
e`, so there is no flow-control backpressure to slow a hostile client.

Authentication runs in `onRequestRecv`, which nghttp2 invokes on END_STREAM=
 =E2=80=94 i.e., after the full body has been received and buffered. This m=
eans the entire body is accumulated in the `HttpBody::reader`'s `std::strin=
g` *before* `onRequestRecv` ever decides whether the request was authentica=
ted.

The result is a pre-authentication memory-exhaustion primitive over HTTP/2.

## Reproducer outline

The reproducer is a short Python script using `h2` (the `python-hyper/h2` p=
ackage) and a raw TLS socket. It:

1. Performs the TLS handshake with ALPN `h2`.
2. Sends the HTTP/2 connection preface and SETTINGS.
3. Opens a single stream with `:method POST`, `:path /redfish/v1/SessionSer=
vice/Sessions`, `Content-Type: application/json`, and a body length declare=
d via END_HEADERS (no Content-Length required for HTTP/2 streamed bodies).
4. Sends DATA frames of 16 KB each in a loop, never setting END_STREAM.
5. Calls `nghttp2_session_consume_*` equivalents on the receiver side via f=
low-control updates as needed (nghttp2 server-side replenishes automaticall=
y; client only needs to keep streaming).

Against a vanilla bmcweb build with HTTP/2 enabled, the BMC's RSS climbs li=
nearly with bytes sent. Death threshold depends on platform RAM:

- 256 MB BMC: dies around ~200 MB sent.
- 1 GB BMC: dies around ~800 MB sent.

The session does not need to be authenticated. The BMC does not return any =
response until END_STREAM, which the attacker never sends. There is no rate=
-limiting between DATA frames at the bmcweb layer; nghttp2's flow-control w=
indows are auto-replenished, so the only bound is the attacker's network sp=
eed.

I will not attach the reproducer to this list post (per `openbmc-security` =
guidance about not posting exploitation tooling to the public list). It is =
available on request to anyone with a legitimate downstream-vendor or fork-=
maintainer interest. I plan to publish the reproducer alongside a writeup o=
nce a fix is in master.

## Suggested fix

Two options, in increasing order of robustness:

**Option 1 =E2=80=94 Per-stream byte counter on `HttpBody::reader`:**

Add a `size_t maxSize` field to the reader, initialized to a sensible defau=
lt (the equivalent of `BMCWEB_HTTP_BODY_LIMIT`, or 4 KB for the unauthentic=
ated case if the auth state is available at reader construction). In `put()=
`, accumulate `bytesReceived +=3D buffer.size()` and return an error if `by=
tesReceived > maxSize`. The nghttp2 callback can translate the error into a=
 `RST_STREAM` with `INTERNAL_ERROR` or `ENHANCE_YOUR_CALM`.

This mirrors what Boost.Beast's parser does internally for the HTTP/1.1 pat=
h and is the minimum-change fix.

**Option 2 =E2=80=94 Pre-auth hard cap independent of `Content-Length`:**

Set a 4 KB hard cap at the start of every HTTP/2 stream, before authenticat=
ion runs. Once `onRequestRecv` validates a session, the cap is raised to th=
e authenticated limit (`BMCWEB_HTTP_BODY_LIMIT`) and any already-received b=
ytes are checked against the new cap. This requires the reader to be aware =
of the authenticated/unauthenticated state, which is cleaner if done at the=
 stream layer rather than via the reader's `put()`.

Option 1 is the smaller patch and unblocks the immediate issue. Option 2 is=
 closer to how the HTTP/1.1 path actually works after the `Expect: 100-cont=
inue` fix.

A separate, related concern: the HTTP/2 path has no overall connection dead=
line timer comparable to the HTTP/1.1 15-second request timeout (`http/http=
_connection.hpp`). A hostile client can complete the TLS handshake and the =
h2 preface, then idle the connection indefinitely. This isn't part of H2-F1=
, but a fix for H2-F1 that doesn't also address the lack of an idle/deadlin=
e timer leaves a Slowloris-style primitive in place. I'll send a separate p=
ost about this if useful.

## Timeline

- **2026-02-23** =E2=80=94 Reported privately to `openbmc-security@lists.oz=
labs.org`, bundled with the H2 reserve-crash issue under a single email sub=
ject. Acknowledged the same day by Joseph Reynolds, forwarded to the bmcweb=
 maintainers.
- **2026-02-26** =E2=80=94 Gerrit change uploaded by Gunnar Mills addressin=
g the *reserve-crash* portion of the bundled email (`http/http_body.hpp::in=
it()`, Content-Length guard). The body-accumulation portion =E2=80=94 this =
finding =E2=80=94 did not receive a Gerrit change.
- **2026-04-21 17:31 UTC** =E2=80=94 The reserve-crash patch merged to mast=
er as commit `62526bb0`. The body-accumulation issue remained unfixed.
- **2026-05-05** =E2=80=94 Status-check email to the maintainers. No reply.
- **2026-05-14** =E2=80=94 Maintainer reply (Ed Tanous): the publicly discl=
osed sibling bug is "no longer embargoed, and the fix is on master. There's=
 no longer a reason to send direct messages to the security responders. If =
you believe further action is needed, please use the normal project communi=
cation channels (mailing list, discord, gerrit reviews)."

This post is that follow-up.

## Acknowledgements and intent

Thanks to Joseph Reynolds for the initial triage and routing, and to Gunnar=
 Mills and Ed Tanous for the fixes that did land on the related issues. My =
intent in posting publicly is not to escalate or pressure; it is to honor E=
d's instruction to use the public channels while ensuring that downstream c=
onsumers =E2=80=94 particularly BMC firmware vendors who track upstream bmc=
web without independently auditing the HTTP/2 path =E2=80=94 have the infor=
mation they need to patch.

I'm happy to draft and submit the Gerrit change myself if it would help; le=
t me know.

Best regards,
binreaper
bobdabot@proton.me



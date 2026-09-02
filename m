Return-Path: <openbmc+bounces-2528-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6572C624D6
	for <openbmc@archiver.kernel.org>; Thu,  3 Sep 2026 00:39:48 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hb11r45kNz2ytT;
	Thu, 03 Sep 2026 10:39:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1130" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788368238;
	cv=pass; b=VHhnskcR+DloSM1uBvv3LIzGhJlY4oeDu74Per2kLJH5JU+P1psTrYVyriO+1/PAee/BpM+nwNgeSS6a1fWXefbxf+bXQElhix/JJZoyw1MH/bzlSszqpsGQusBuT9PPIKdzuhzcU9VhEYyNqoNwSnd7k4J0KUKYkOMVR6/i7pkMsPP0bzDgmLPJUPSqsbMKK82TXfk3h0ZlkDma2L7mTEFVNBy7FsG1JvVTmWfhaKToxvwqE2zgsyGW4tM+i7GEDlwTu0GnRp+YMLh64sWs+u/MU+zAeiuPlhjY/JEoWT0SyyvbaMO7xC6omM07DhvY1+BUUgpedyRqM2EoDHohhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788368238; c=relaxed/relaxed;
	bh=6dKNNFPKdAahHAjrQ1pJYq4PeLi9PZ2Uzn6gnXlzXfk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=aS3pWZR4udQMyLfxKP4gfwUs8y4esOwwFAIJBGGHBgLZkJHEka9bc2mlAad3tqUUa9Z9E5a1q+c0NhqnC/0pwjgY2CFqvcgTk4aTwhJUeMW0loCrioz/GIfehKyVHtDoeKhSq3ohwyh1CbtAfmfS5BgH9Fby/DRsb5lk8ABKyiduU2O48eBIsnwDjst66sepm/TRKjRNOXL41ufPH0xWsT8VeeHMQRJCsATizAtETIQWm7RF8rReFK5GGAR/piRPD2Rv0vTRda1N4SjabyL2bKCSPgXlPMXXrwY9UJ9hqwf1i9GaMkVdxeCiCvuRPX4tf9FephsWN5XOavyyZsjrsw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Qc2jTU15; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com; envelope-from=alanhc.tseng1999@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Qc2jTU15;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com; envelope-from=alanhc.tseng1999@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hZpms1zjCz2xl6
	for <openbmc@lists.ozlabs.org>; Thu, 03 Sep 2026 02:57:16 +1000 (AEST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-85aeb506b78so22183527b3.3
        for <openbmc@lists.ozlabs.org>; Wed, 02 Sep 2026 09:57:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788368234; cv=none;
        d=google.com; s=arc-20260327;
        b=hWB9SmuH6b+uID5FdvFqnE0r0TS+Z3iYOtOMfHxQpvo8Dz5WUYodYjIba2e9Ro6s0x
         NznMx5eX+DSqM5cAIITZg5QEE/p1UsFoh1zqKHo44S+eEMMOpsMFEY2LB7RxWOjV10Ns
         viUS9CLI/CB2vxgBhm8b7f/YTGcLqKImvVgg0ozlSmIFdg4CwXL50fr2F9N8HtLFVxm/
         YTiNUUNLMHwVPCsCJ1kLIg3MMGftu9y0OckjYkdPdDgboNkq4h92/curjeMdUJpuD/hV
         GOvcRu9XJux/9HEiQZJIn9bRDjN+8zO+cKv4QN2aVnQa00RywwJpSrISy1Qu5wHhZwnV
         2ZLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=6dKNNFPKdAahHAjrQ1pJYq4PeLi9PZ2Uzn6gnXlzXfk=;
        fh=B5hptedw+6RyGR/i2ArH91xOt8ZhRewMTnM2T7RVmak=;
        b=EPdzxB0YcF8YuZyaADKAy1VCMDwOf6VAX9FFAivMmw8tSvFutWueC72KKFjgVXSgEV
         PVWGq4Z6JMWCGXhH7OACqaT83LRzcMAe4yw9OJDpWlpOtUUgnsbyQWwZB9hR94uPzApv
         n8m/VYTK1c7FXcegfa8yYzlJlTxf57K7mIDiqjvDZM6FB63iwtF7D2s96Q+tT7XmPqSc
         ivhwJh/ixMzcy3qFWIyB8JQLYD+1H56IKTpYNlwbjZp0tdrOtcN0GSHFn2qTjHHYv42A
         xeVSse44jyzrTJiNRtE2o4cismCOsO3mtV951BazJT3AOFvKhRriUjLdFv88x273K9PV
         sGJQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788368234; x=1788973034; darn=lists.ozlabs.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6dKNNFPKdAahHAjrQ1pJYq4PeLi9PZ2Uzn6gnXlzXfk=;
        b=Qc2jTU15A8oGiMQJGKXKY+NmMqlp7nwylS3m9aE8W0WITGfeZ8XM+A1r2W5dJOA2vM
         2BLLV9zVxzOpuBNCl9qWF6eMS5GSTUoIuc/FwH+wEi8p5R+VRXmQQWKBlPgSWTkYGKC4
         HHOpz+BYR6PLUvsKF+c3FgoQWI60ZBuCh20vsYpknagvWDxt7q3JuD9doJy5BrLohyHO
         Soq/HNLjLuyRj6A5oTDtMrASTqnP/Xm9mPevDoh8I9/ZyI9KZ9ONt+DxfakoejU/XD7l
         QZ1yfYRtCpWbmY+/mZxzHteNd87MFwo8/GxOqfumyodFQFeVqLTMFx46MORaHO7gZVWS
         Q8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788368234; x=1788973034;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dKNNFPKdAahHAjrQ1pJYq4PeLi9PZ2Uzn6gnXlzXfk=;
        b=e3h6vajLsrkzQTenh3ze3AfBkkQvDAoWsLVxFJpk/Y3Eg9RXsltCqmcL9RZVXXQqKd
         u4w6s56OZ2bAWKrM0tBUEtaWiMe1WoCQFaX8SRnw7fa8xGHgV+hjDUv/19+59/m8RCQn
         9qhALO2JfiqUyLRzCXn/JRiUBQHiGspSIdus00W/idc0nI4sJxzcPELzuZpZEiibz5+R
         Ub8l+wDB1IRAnsmvk+pNj9nFWwsDcyYy64+4rrWT64Jr/qkGq3d84qGO7/vSUf8P+vfb
         xOt9YtySLoCMyXyNSSmCNgO3Hwbmg1LnYX1h5HUNH5yGR90DRWpUwA19lqkOWhfZF47G
         dyJA==
X-Gm-Message-State: AFuF++kzqy/bI8mF0skcBZ+uIf1CoZCWsuFcVLyfXaF7a0X0ph/exIcY
	adRsbBdrqbwt6lYVj/zRDxdtiEMDUay4jWclNjvRqC38uMRTOK96vw0l6GKx1vIc7JEbYRpCwXz
	DaCZwwJI+inMvb4i9uoAKJKj9Ij2VTqFogTux
X-Gm-Gg: AYBFou3qnO9buHc7DzGDUTPSyLrGJBP8vcFobcTTBexJLeXHokxJfe6f7BjJ8TIkcIu
	T7wLAo4h1hnsWs13CEG8OwdMd/Oc+QT6r9q4LThH+faA2jGrQZQZTvTLYVhRSrU7lK80TCiqbKo
	4Yw4WfaEmc7MdnX3H+ox5dvchyLC0bxk8lZqltsOBN/7lO7MPWqwANEWHg6LjYiVYJjVw2RTzid
	DZ/GhBwQfyAKr9NhO8RM8FJwPMbyk4BGK4Cl1YuM2W5PwD1C9FQiFZTfZSYK0Fm9pBlF9bPjTwy
	KPPYhX39st6p9Ct3xeK0Lis3tzg6C+G5tCuOHbDgHioOMXNkzrLWaOYNokUj3BGke7x3SD9DFIJ
	+spVSYQfAU6cw4dVQW4fK+vkj+YnDxC7Y
X-Received: by 2002:a05:690c:e291:b0:826:8d02:9c1e with SMTP id
 00721157ae682-86c50bc5a8emr26808197b3.13.1788368233866; Wed, 02 Sep 2026
 09:57:13 -0700 (PDT)
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
From: Alan Tseng <alanhc.tseng1999@gmail.com>
Date: Thu, 3 Sep 2026 00:56:35 +0800
X-Gm-Features: AcwNN1VB7OVwDyC7TzBDQ2P2th_4rsmrRVNRPopDJfnauGl5xDbTQzzIIoloiQA
Message-ID: <CAF=WuWzCph7QzJgrPO_XsOuAiAww_byW_sh1chkdOrqVwNXZsA@mail.gmail.com>
Subject: libpldm: CI not running for new contributor (93691-93694)
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000004eabdd065a82ed33"

--0000000000004eabdd065a82ed33
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm a new contributor and could use some help getting unblocked.

I have four patches in libpldm that have been sitting since Aug 19
with no CI runs:

93691 - platform: Reject a compositeEffecterCount of zero
93692 - platform: Reject a NULL field argument
93693 - platform: Avoid unaligned loads in value encoders
93694 - platform: Use the sensor data-size constants

https://www.google.com/url?q=https://gerrit.openbmc.org/q/owner:alan.tseng.cs@gmail.com&source=gmail&ust=1788454438947000&sa=E

Every patchset gets "User not approved, see admin, no CI" from the CI
bot, so Verified is never set. All four have Signed-off-by and were
just rebased onto current main, so they're mergeable now.

Do I need to sign the CLA first, or is this a matter of getting my
account added to the CI allowlist? Happy to do whichever - I just want
to make sure I'm not waiting on the wrong thing.

Gerrit username: alanhc

Thanks,
Hung-Chun Tseng

--0000000000004eabdd065a82ed33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"auto">Hi,<br><br>I&#39;m a new contributo=
r and could use some help getting unblocked.<br><br>I have four patches in =
libpldm that have been sitting since Aug 19<br>with no CI runs:<br><br>  93=
691 - platform: Reject a compositeEffecterCount of zero<br>  93692 - platfo=
rm: Reject a NULL field argument<br>  93693 - platform: Avoid unaligned loa=
ds in value encoders<br>  93694 - platform: Use the sensor data-size consta=
nts<br><br>  <a href=3D"https://www.google.com/url?q=3Dhttps://gerrit.openb=
mc.org/q/owner:alan.tseng.cs@gmail.com&amp;source=3Dgmail&amp;ust=3D1788454=
438947000&amp;sa=3DE" target=3D"_blank">https://www.google.com/url?q=3Dhttp=
s://gerrit.openbmc.org/q/owner:alan.tseng.cs@gmail.com&amp;source=3Dgmail&a=
mp;ust=3D1788454438947000&amp;sa=3DE</a><br><br>Every patchset gets &quot;U=
ser not approved, see admin, no CI&quot; from the CI<br>bot, so Verified is=
 never set. All four have Signed-off-by and were<br>just rebased onto curre=
nt main, so they&#39;re mergeable now.<br><br>Do I need to sign the CLA fir=
st, or is this a matter of getting my<br>account added to the CI allowlist?=
 Happy to do whichever - I just want<br>to make sure I&#39;m not waiting on=
 the wrong thing.<br><br>Gerrit username: alanhc<br><br>Thanks,<br>Hung-Chu=
n Tseng<br></div></div></div>

--0000000000004eabdd065a82ed33--


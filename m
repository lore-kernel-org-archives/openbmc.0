Return-Path: <openbmc+bounces-2651-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA2DC98318
	for <openbmc@archiver.kernel.org>; Sat, 26 Sep 2026 09:01:50 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hsM4n2mR0z30WQ;
	Sat, 26 Sep 2026 19:01:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:41::f" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790322561;
	cv=pass; b=HZZdgVEowMRkAhGYDVY+TAxYGQagjOYrfZbrMdAbDMxDu8ybmw3dbFylvYPT2Gow4m4hMQGJGL+tAkeUhGt2wNH0kr9MH0GdLNaZsg625NoPUm+wP+EcyMiDKCx1uJJTz7ti3+VlSg6IE7d1dFsg5pYhwMWAUlveIHHYAoZqofZDwm2X07vd4BxsM5mmFzhvvvZ66VYpFuDhpqMIktrnwZd/YaeTGEhDGLGrHsvhSv43dU8O9lTw+ioqeszMNJkcJ2EZSC361mI0YYUKrqucgY1AhIj8MrwBzMKCGlgxBbZhI4CbG//TPBVjif0Eh9gdR+T39JXX/BTcCcUNp/XRsA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790322561; c=relaxed/relaxed;
	bh=6EJOrZ8mI2A9idaQR3Px6nbyS41Xvhro9mf00wQpi88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HPmP4KbeQ5p8EyXDHbwe1ky5dSf1tj3vApmqYQIfeL82zNuwytcplTZ9SS7b9ZFAIFzOMvV2cAFkYSgKc7SAI0fZ+QhS/rol1Axxdq4ndjhloU8VmZons8Qbw7mDdyV5jT7YNR4abGXOsZrX7HWKfGleQEEoMQXhAc4ISgfZLc7k6h4KJ/BUAtKxieH7Cuhl2fUg+U35bPml7DNextEwGt/H2cYhGXqtzwh63KWb8RuMH2QQHl60v0hFi3OkF9lc0Lr/vD23FHiFJV8q9IStQuOFbuJlbplj+Zi4V2Kgbi/xlUuYTifI7lvJ8YXdd+rNujsF66w/4yx6yOJz5OfWHw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dn9HyqJN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:41::f; helo=mail-yx2-x0f.google.com; envelope-from=alanhc.tseng1999@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dn9HyqJN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:41::f; helo=mail-yx2-x0f.google.com; envelope-from=alanhc.tseng1999@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx2-x0f.google.com (mail-yx2-x0f.google.com [IPv6:2607:f8b0:4864:41::f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hrjX00LS4z2y2M
	for <openbmc@lists.ozlabs.org>; Fri, 25 Sep 2026 17:49:18 +1000 (AEST)
Received: by mail-yx2-x0f.google.com with SMTP id 956f58d0204a3-66e4ab22370so598846d50.3
        for <openbmc@lists.ozlabs.org>; Fri, 25 Sep 2026 00:49:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790322556; cv=none;
        d=google.com; s=arc-20260327;
        b=XDy7cfRFfDFLUIksbTe8eaK1spjabg3d6q7Iqlb1BWf6nMz7iSXArImjtO2PcnS4hF
         IBGjkJCqRT5iiI3y8Bcm6PkePSGNq0MdsONLwz5CEXK/TQ58eGoChVIMH6cBHYsAaKOl
         8ck4q1wmweq9yPiol2y2FUY+WMEK1Vw7642TSmU/98u7teSI9TbEVYf+bh4scURWQcHp
         vk1Ll8YRc08QqzJ8NXgY7JPykxL6OGpaLK1lmfgsbdMPESGLhnX25KvbJL1Ts5SbYFyc
         +jp8zwmBq2Pwpd6V175gOdVOuLScut7LrNDqVumn5L2JLxh4Pujmmw7M8ccT017/csRj
         W9Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6EJOrZ8mI2A9idaQR3Px6nbyS41Xvhro9mf00wQpi88=;
        fh=YuCTEp5BZLuV+bLuC8TDJ5ZFGPv75xxUeDjDi6HPpOk=;
        b=VWVd8ae+GR1XZ8o1LlPtW3aYzYX+GX8hIPc/9WXXEODeO9jHRxSpkNmle2ieW7LaXs
         4Vwru+A9NcD5ckLMuiRoZI0/JtAthPhOjn5o1U8RT8EhxFRohtvOCrzFngNUCPXTykBA
         3LV/MDgbuJIMBM2GBbmJ2RjpPyCafqeI/G7YBjvXoR9kwZ9yD+71Ja0IfzJyLMDLKeTS
         Ixhcyg5DSvo7S4FOE+5yR7T/H+8xcYvfXj/g7zk3uXnXh/zcODmi988S5rfsx2fCdAC8
         PbqgnKWHq+HQvxco6hqupTT6+bP9FPh7n9tGRL6nOZUuaBFwmAEFxufTD1lX8tCP4GT9
         tHng==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790322556; x=1790927356; darn=lists.ozlabs.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6EJOrZ8mI2A9idaQR3Px6nbyS41Xvhro9mf00wQpi88=;
        b=Dn9HyqJNo6PukwWIjttvn0hH0NKcZNIkQseKNjHfXvwUswG7p9dtKerrudGu5SQ9EJ
         7n+BMsWyGH0vZ+XjCDcYClcq3uifOxoRgWy5r6kGIxvQ2VpM/NEuxVFYv+jjTjGTUJXR
         HzSWl0LV9k9ZAxKwaaQsIhU1zvJCQmyAUEjcZ6/rUk0DCfw5f9zzW2FGBT0YYXkLpAnS
         qFhbGjnmNqX0I7IwOEtsK5KzyrLynsVOYNYQ+UIjBmMTynOQ5D5LSl2wYhw4xHxhKFyk
         E5oNAkyMnrUIfFgd27FQYZYJvYqOacxgHrvXWB2E8SwbNSJgwrXnRnxppjdsl0tJnlA6
         vvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790322556; x=1790927356;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6EJOrZ8mI2A9idaQR3Px6nbyS41Xvhro9mf00wQpi88=;
        b=kBGn/2ph5aTs+rHrLZNy8YeXVS+6ngLzvyeEj9od5uOtInJQklQELQ436S3lbc7klu
         6A9rjj+Vqnz7ZD6hJtsyONLQesONBu7RC8E3DG9uUtLJd//xTfPrFPFeyGfSAstVtww5
         qbMbDPWglKInYVrbNgorexnANtsD5LAGHkoTW9G7WZl9RBNTw+SRD3Vtz2h3Wal+RqCO
         Fx1qNJb1buw26vFruhDBWc/XP+E99Z+FABTc60z1AxAretn1VlARa3HaggMfDtuFFVzg
         LYk5mBKg3ig2k3fMnNl1ZGIqmTfZoKK/izDHuzOP28NpkO7DNMaPKbK8PBueujwBkTLp
         sFyA==
X-Gm-Message-State: AFuF++n8agejDVOfoKUs3kgxFlEjagKN7PTU8WVr5mwyyy6yTMQ6OYeU
	7S884sW8vixcJBvk9Xlw2CqDyeNSWQmStv9aesH0jiHBSdVxBpwmTx2tS30gagua1QQSiUKt+jo
	UiUOahlFQ+8k+1HmC6H1B5IvC4/+XnymPZZ1y
X-Gm-Gg: AYBFou0BGy3nBY240La89QigycXY0mVLeqpGh2OtBO3oYlAgbCiNEOIzHhGDAplk4PD
	8bnOHs1GXrI7QWyPsWNMBMqd7mPtKcvpQnBRoIEpZQ7KFv6fkE7B3jUHb8gLElZHXxujIkeZy0D
	Iw4xN3G046rOtID6AI6xTpV/Y8P+3G+sma22M2hPbx+6sfw9sxSmuXZKT0WFRie9FnIHYhKl9gw
	mk5uezbOaN6G1qw/vU5xN75pzUSNDl+YCgdD+m4O+2thhLS7/MiNYbeU/6e5EeSJaK+Md0R+1Ji
	XSL6MdKXuQTKpPUAPlABmgGX8ecnNIpmLJ6Ji1wRBh5T+mF8hk8sHHdlrag7H8e8IeXBYTI8cnD
	09kFn8XKFvsVNjsHF803LA6ZI+JV1wk9z2s3+brCJqjqzaA==
X-Received: by 2002:a05:690e:1686:b0:66f:b07f:58ee with SMTP id
 956f58d0204a3-672ed1cba3amr2251876d50.1.1790322555656; Fri, 25 Sep 2026
 00:49:15 -0700 (PDT)
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
References: <CAF=WuWzCph7QzJgrPO_XsOuAiAww_byW_sh1chkdOrqVwNXZsA@mail.gmail.com>
 <f2d729c0ca7f6587393c1a58799f2921f46c749d.camel@codeconstruct.com.au>
In-Reply-To: <f2d729c0ca7f6587393c1a58799f2921f46c749d.camel@codeconstruct.com.au>
From: Alan Tseng <alanhc.tseng1999@gmail.com>
Date: Fri, 25 Sep 2026 15:48:38 +0800
X-Gm-Features: AclHuK8Wl_lHFYnAnqC_REhg9GJAPHvORL5y2oVg0ecj22Slk075EoZlwks8W3I
Message-ID: <CAF=WuWziOgg7rUcdv8KOWCs+gko0vkzgkkhxeFjQje29jiRD_Q@mail.gmail.com>
Subject: Re: libpldm: CI not running for new contributor (93691-93694)
To: andrew@codeconstruct.com.au
Cc: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Thu, 2026-09-03 at 11:23 +0930, Andrew Jeffery wrote:
> > Do I need to sign the CLA first,
>
> Yes, see:
>
> https://github.com/openbmc/docs/blob/4998187c05e8d4aee496081d5a37fe71db11642d/CONTRIBUTING.md#starting-out

Thanks, and sorry for the late reply; I missed this because it went to
a different address than the one I watch for OpenBMC mail.

To correct my original question: I had already signed the Individual
CLA and sent it to manager@lfprojects.org on 2026-08-20 (followed up
on 2026-08-25). My later comment on 93691 saying otherwise was wrong.
There has been no response from the LF yet.

Alan


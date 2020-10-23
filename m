Return-Path: <SRS0=sKPC=D6=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531A5C388F9
	for <openbmc@archiver.kernel.org>; Fri, 23 Oct 2020 23:34:13 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A86921D6C
	for <openbmc@archiver.kernel.org>; Fri, 23 Oct 2020 23:34:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyjDD80F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A86921D6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CJ0tV0qkvzDr31
	for <openbmc@archiver.kernel.org>; Sat, 24 Oct 2020 10:34:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22b;
 helo=mail-lj1-x22b.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IyjDD80F; dkim-atps=neutral
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CJ0sD592FzDqZH
 for <openbmc@lists.ozlabs.org>; Sat, 24 Oct 2020 10:33:04 +1100 (AEDT)
Received: by mail-lj1-x22b.google.com with SMTP id d24so3261294ljg.10
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2020 16:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=VqKYCCQm3Gz9rNCEaI+XfESKyZJnkZrN85X1T4GsqPU=;
 b=IyjDD80F12ahH8tRqeaxznUBp51fCkMjwW+kw6+x+5JkNL3n+K1nNiji0cJLkzbOib
 XgivE3WdvE2G/zWC5zWn5fezjoxczX+32ztvSxrzh8RWArg6UBdBNCGPiZTxUlB+2Ow4
 tj7pfT7vtxCufnsQo38GWg8UA5KMgxsxRaf2D/QB04ctrEuZjh1Eg972k7URvSfr+D+/
 B+lkY0hoA5wdvnvA5wT3OsVWVcOW6DmC2JizIG1BNL2Dj42QSietW4M9h4+HFxPHnf6r
 ceSyjIwZ50tE1n9dOX+5z3taBmwiTau96hhoH4UbUhV2MFYdgrE3lKHYwUvx/OGCfrEa
 nrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=VqKYCCQm3Gz9rNCEaI+XfESKyZJnkZrN85X1T4GsqPU=;
 b=L5yo7ZKgWynwN7MdrjDFZzIOoewGI0+iMHBSRy3Y65VuGusMrwJy3/YwGwyYlibGyW
 cX9OGturAWMU1rHaRrvQavC78Y36Y0nYG38jX0Pg02QeE7mwUhx66qzycvCileGYtV/e
 jT3eBEmcLjQlZJsbXJQqSPgo4DUW+sWSHky6vnsgi9d5Y0cTXFhGXQHKjzFmBOx6Lv4G
 oSxvhxTN0XTg4e0mpVGM1xuwqIkFL/r7Yg4hZLtAxuHiGZoSDCnHPNxCVlNl5o+abVr2
 kn6xcHWIvqZ23V3ENLqBXqf/GFzapxKDZOzIwMIg7Z3TYnxpf/b+hvvkzdqEarqQYXYf
 3oFw==
X-Gm-Message-State: AOAM531j0ZPfgrGIvEveogkjXammxRS2Gz6fLqRLqoAK4R88QyzyHs3Y
 khN5L1EwhjL2V9s/qdpkt74ZcdTxBh9bFtjGgckmvlLNavc=
X-Google-Smtp-Source: ABdhPJzczDjOzkEFlUDteTBCfyo3nD1VyhSX1LB7B28Duvz+FvZ6v4j2g8LEBN9JFX0ZyO9S8EdNaHl7jyj+CKgjwyU=
X-Received: by 2002:a2e:9a17:: with SMTP id o23mr1902434lji.242.1603495977905; 
 Fri, 23 Oct 2020 16:32:57 -0700 (PDT)
MIME-Version: 1.0
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Sat, 24 Oct 2020 02:32:46 +0300
Message-ID: <CACSj6VWwa_YM6sHzc_LLO_7wbv8aBv3Tsaw4+3j92hkjfh_z6A@mail.gmail.com>
Subject: "ipmi_kcs3" name is not respected by default "channel_config.json"
 file
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

The current code in kcsbridged creates a Dbus object
"xyz.openbmc_project.Ipmi.Channel.ipmi_kcs3". And this name can't be
handled in ipmid with the default "channel_config.json" file.
Look at the code from the
https://github.com/openbmc/phosphor-host-ipmid/blob/master/user_channel/channel_mgmt.cpp
:

int ChannelConfig::convertToChannelNumberFromChannelName(
    const std::string& chName)
{
    for (const auto& it : channelData)
    {
        if (it.chName == chName)
        {
            return it.chID;
        }
    }

This code compares "ipmi_kcs3" string to every channel name in the
"channel_config.json" file. And by default the channel for the kcs
interface is named 'SMS' in this file, so there would'n be any match
(https://github.com/openbmc/meta-phosphor/blob/master/recipes-phosphor/ipmi/phosphor-ipmi-config/channel_config.json).
To use KCS interface I had to change the name for the channel 15 to
"ipmi_kcs3" like this:
  "15" : {
    "name" : "ipmi_kcs3",
    "is_valid" : true,
    "active_sessions" : 0,
    "channel_info" : {
      "medium_type" : "system-interface",
      "protocol_type" : "kcs",
      "session_supported" : "session-less",
      "is_ipmi" : true
    }

Is the override for 'channel_config.json' a correct solution, or it
should be dealt in another way?
Does any board have a working KCS interface? How does others deal with
this situation?

Best regards,
Konstantin Aladyshev

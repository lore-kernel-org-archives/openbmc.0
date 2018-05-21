Return-Path: <ojayanth@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400c:c05::22e; helo=mail-vk0-x22e.google.com;
 envelope-from=ojayanth@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oO9Wwcw0"; 
 dkim-atps=neutral
Received: from mail-vk0-x22e.google.com (mail-vk0-x22e.google.com
 [IPv6:2607:f8b0:400c:c05::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40qFSx2SdzzDr2m
 for <openbmc@lists.ozlabs.org>; Mon, 21 May 2018 20:31:56 +1000 (AEST)
Received: by mail-vk0-x22e.google.com with SMTP id x191-v6so8471456vke.10
 for <openbmc@lists.ozlabs.org>; Mon, 21 May 2018 03:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=fVuOJsNuWjPYOZAooK8nWLSMRMmUPqCQTWUNi0zU/gs=;
 b=oO9Wwcw0CRwZckEOgCF31ZrOhxvCxDg3oxzJ85nx7niHN5nWL66duouvMUiQIUI5E3
 Dv9Jc0ZWkbxzwSZcFKmgetILLGysJq5Q+lo+0KAx2WmgNWkjKlOQc3uxI+gqh8kh1RqX
 3xt6yjCL6IbxEZ4e/8C4ZayoEbhaOTwzu8Ykr3WdTbQFSkPIYyfNYwSQuECBtSb5EsjU
 RivLiw8K7IUB/+gD61mJ7jfS71IczGnXnmKaM+vbIYwjLwgz6tEt9tTObViv3iqJBaKt
 Xunflc8tarf9wcPr+b860h0bKTaFn/MOqKDhUWlRmJTs2FOh2MRhYR+QLB+cexD9iSYv
 m/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=fVuOJsNuWjPYOZAooK8nWLSMRMmUPqCQTWUNi0zU/gs=;
 b=cD3i41zfORaFPHXdcUyku4q1mojEgnIEm+ze2FNO3EXZidQKYvL4dW8tjMCTbvFE5U
 9N/kNkrikknK0vTX4Jfy/YQS4Sf8NseVTvoZ67lMhmT82wtuzI8hd7yV1uzfimUhyw8J
 6SoP9oFVE6R7eRYBQzYX4PdT1ChM76Hu5icDjtAbp2Fqmwst5IV8/HFdEJ1RFAIrHHVr
 HI0LXFVQXIFAAULb9RfNOI4QFTgpBvPM3Mjs9+bqC78gQ+5XgM04c+rh/X0ZdQZgh5o7
 ppdguA2aGBudHh2zhOYi0nco1h9Av2+dNxvlW4zUNqKdSPcbC6bWnFf7Kuy1jHrIIlcK
 we5Q==
X-Gm-Message-State: ALKqPwf/Mw8l0KZrq7RpdJNuBQRUj/RkK9ePyuiB/7w5XLeZIZDnmu65
 6rZl8gvskA8jRdX+8FUTPppJQZTKkwPh/90EZ592Vg==
X-Google-Smtp-Source: AB8JxZpii+f5xKuUIieBLiXas3CEIhGxc9Cp3Durj8pUo00PpL4mF2NCdOwnlgDIq/XioNvuwVprku3AVkAndRARKZg=
X-Received: by 2002:a1f:9742:: with SMTP id
 z63-v6mr12951836vkd.94.1526898714015; 
 Mon, 21 May 2018 03:31:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.48.16 with HTTP; Mon, 21 May 2018 03:31:53 -0700 (PDT)
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Mon, 21 May 2018 16:01:53 +0530
Message-ID: <CACkAXSoCB+s0FVvbQ2JD3XUXb5qP1bUujHdMAXtzA606-KfdOg@mail.gmail.com>
Subject: Proposal for Error Log triggered BMC Dump creation.
To: openbmc@lists.ozlabs.org
Cc: bradleyb@fuzziesquirrel.com
Content-Type: multipart/alternative; boundary="00000000000074fd4a056cb4cf73"
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
X-List-Received-Date: Mon, 21 May 2018 10:32:02 -0000

--00000000000074fd4a056cb4cf73
Content-Type: text/plain; charset="UTF-8"

Background:
Currently BMC dump is created based on one of the following
        * User Initiated
        * Application core
        * Error Log of type "Internal failures"
        * Host Checkstop (to be done)
..............................................................................
Extending Dump Infrastructure:
The existing Dump framework can be extended as follows to support new Dump
type
and/or new dump content:
1) Existing Dump type with existing plugin(s)
     * Annotate the plugin with the dump type.
2) Existing Dump type with new plugin(s)
     * Provide the plugin under plugins.d
     * Annotate the plugin with the dump type.
3) A new Dump type with existing plugins
     * Configure the new dump type in sample.conf
     * Annotate the plugin with the dump type.
4) A new Dump type with new plugin(s)
     * Configure the new dump type in sample.conf
     * Provide the plugin under plugins.d
     * Annotate the plugin with the dump type.
..............................................................................
Motivation & Proposal:
The current dump management framework allows to collect debug data upon a
User
request. Also additional debug data can be collected for internal failures
over
and above what is present in the Error Log. This proposal extends the
framework
to associate dump creation with specific Error logs.

The design guideline is to create a dump based on the Error code.  The
framework consists of a json based policy configuration which associates the
Error Log type with the corresponding Dump type. This framework provides the
flexibility to configure the dump collection behavior for an existing Error
Log
type and/or for new Error Log types introduced in future. For every Error
Log
type that must trigger a Dump, there must be configuration info int he json
policy file. The policy configuration is compiled binary config info which
will
be used by Dump Manager.
..............................................................................
~

~

--00000000000074fd4a056cb4cf73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span class=3D"gmail-gI"><span><br>Background:<br>Currentl=
y BMC dump is created based on one of the following<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 * User Initiated<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 * Application core<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * Error Log of type &quot;Internal failures&quot;<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 * Host Checkstop (to be done)<br>.................=
.............................................................<br>Extending =
Dump Infrastructure:<br>The existing Dump framework can be extended as foll=
ows to support new Dump type<br>and/or new dump content:<br>1) Existing Dum=
p type with existing plugin(s)<br>=C2=A0=C2=A0=C2=A0=C2=A0 * Annotate the p=
lugin with the dump type.<br>2) Existing Dump type with new plugin(s)<br>=
=C2=A0=C2=A0=C2=A0=C2=A0 * Provide the plugin under plugins.d<br>=C2=A0=C2=
=A0=C2=A0=C2=A0 * Annotate the plugin with the dump type.<br>3) A new Dump =
type with existing plugins<br>=C2=A0=C2=A0=C2=A0=C2=A0 * Configure the new =
dump type in sample.conf<br>=C2=A0=C2=A0=C2=A0=C2=A0 * Annotate the plugin =
with the dump type.<br>4) A new Dump type with new plugin(s)<br>=C2=A0=C2=
=A0=C2=A0=C2=A0 * Configure the new dump type in sample.conf<br>=C2=A0=C2=
=A0=C2=A0=C2=A0 * Provide the plugin under plugins.d<br>=C2=A0=C2=A0=C2=A0=
=C2=A0 * Annotate the plugin with the dump type.<br>.......................=
.......................................................<br>Motivation &amp;=
 Proposal:<br>The current dump management framework allows to collect debug=
 data upon a User<br>request. Also additional debug data can be collected f=
or internal failures over<br>and above what is present in the Error Log. Th=
is proposal extends the framework<br>to associate dump creation with specif=
ic Error logs.<br><br>The design guideline is to create a dump based on the=
 Error code.=C2=A0 The<br>framework consists of a json based policy configu=
ration which associates the<br>Error Log type with the corresponding Dump t=
ype. This framework provides the<br>flexibility to configure the dump colle=
ction behavior for an existing Error Log<br>type and/or for new Error Log t=
ypes introduced in future. For every Error Log<br>type that must trigger a =
Dump, there must be configuration info int he json<br>policy file. The poli=
cy configuration is compiled binary config info which will<br>be used by Du=
mp Manager.<br>............................................................=
..................<br>~=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>~<br></span></span></div>

--00000000000074fd4a056cb4cf73--

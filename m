Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="q15SYBJ2"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="bPRh7gtB"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 442p873xGmzDqHY
 for <openbmc@lists.ozlabs.org>; Mon, 18 Feb 2019 13:43:19 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 058FC22022;
 Sun, 17 Feb 2019 21:43:17 -0500 (EST)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Sun, 17 Feb 2019 21:43:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:mime-version:content-transfer-encoding
 :content-type:date:in-reply-to:subject:references; s=fm2; bh=2RR
 96wHfEsjyps/2PanyMzFJbwb+MyoBhHxOBaUQKWM=; b=q15SYBJ2hH+T8+EL+mI
 Q2gIolNrzr3yAFKPhVk3wBTvUiDfrA3LvgUKKhiloR0ryeuC+UM6ErlNaNsbV3Yi
 7lyjOwJn6xt/S8h8gubiWiTUJhD1D0ufTHIbOGsyD68/VjL/un/YODQrU/o8vAH9
 jaxPX5To9o4mI72stXA+/TaZsTqBcaGwoJz8c22yZjcQqKlgxTqz4B8aNumS5jWe
 tU0nWKVt8pXOMC+i0HVpnBBijOf3ANFuFj1lCqiUUeVnEaeTDpOJWrSQCZcNWsUE
 qscSJX/BEcoodRfb5V5YXhgleIdVybd/NbNmg7QDw8OD+Wi+1iQMADVLanhfxQGr
 qIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=2RR96wHfEsjyps/2PanyMzFJbwb+MyoBhHxOBaUQK
 WM=; b=bPRh7gtBN7WAzTXsOEtjcThkjP/Z7ib8nKhpixtlMjl0h/vtVjeaJ7y1x
 r17lMgZ+trexMAxYYnxL5oGyhJ3qa29oQ+eTy5ELmDRpPzTMlzMjB/JSxjgJ4y4w
 TFSiWAcANi46YBU/TVJl42OeSQUobHcL/pwY+ztskF5K/QU5PQxZo80UnFOWlMaq
 Zq3Z4hx/fyvIkpmCpk8awWe1bslQZQ2iLHDWGslN0eJWsQ67SD9XVI2uRf9WqXWx
 krrmMqoutZy1ntFlcOf62KkgLAEz2KrMvA5w+jxgpO5D/P7wVGr3/maz9tQQLgEu
 v+Y6MneIVDJLoP4VKSAEv3tXK+Ung==
X-ME-Sender: <xms:wxtqXK9weGw20c4deMXRDGhnxieMugwRht1FhmcmaKShpWr8ZbP1zQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrudduvddgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
 tddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkhffvggfgtg
 foffgjufhfsehtjeertdertdejnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicu
 oegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrghinhepghhithhhuhgsrdgtoh
 hmnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecu
 vehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:wxtqXO8p_qgjaKOBwvt3AnYPCE_w_DTH0dcMqbMzQ3kun9z7S6FieQ>
 <xmx:wxtqXLCB4_lXniWAlC2dXuUFQ0pyR8pChZlQVs6l-5EahDaevyuc6g>
 <xmx:wxtqXGxhoQmDUaedd6epk1tBvQ-XouGKnVFpI2YkH8vTSgVTrA8w9A>
 <xmx:xBtqXGJVc6VY42XJEskNZU_fhqb4W57s-L82feFTpdM5muVsCjCZQA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id AB4B2941EB; Sun, 17 Feb 2019 21:43:15 -0500 (EST)
Message-Id: <1550457795.2789588.1659882840.62DCF28D@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Wim Vervoorn <wvervoorn@eltan.com>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-e97eb308
Date: Mon, 18 Feb 2019 13:13:15 +1030
In-Reply-To: <8601ccdff1394f46ab9698e70b11dfa7@Eltsrv03.Eltan.local>
Subject: Re: Building intel s2600wf image
References: <5beefafbdca24738a72f243e667823fe@Eltsrv03.Eltan.local>
 <1550188196.4146662.1658273928.7C23EE25@webmail.messagingengine.com>
 <8601ccdff1394f46ab9698e70b11dfa7@Eltsrv03.Eltan.local>
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
X-List-Received-Date: Mon, 18 Feb 2019 02:43:20 -0000

Hi Wim,

On Fri, 15 Feb 2019, at 18:23, Wim Vervoorn wrote:
> Hi Andrew,
> 
> Thanks for your feedback. I am sorry about that. I will try to provide 
> the required information below:
> 
> The OpenOBMC tree I use comes from https://github.com/openbmc/openbmc 
> initially I was simply using the head of yesterday morning now I 
> switched to the 2.6.0 release to start at a more defined point.
> 
> I am using UBUNTU 16.04 as the build system and have all pre-requisites 
> installed as far as I can see. I can e.g. build the Palmetto on the same 
> system without problem.
> 
> I am using UBUNTU in a virtual machine and have 8G or memory and have 60 
> GB of free disk space.
> 
> To build the tree I started from the clean 2.6.0, the I issued:
> 	
> 	$ export TEMPLATECONF=meta-intel/meta-s2600wf/conf
> 	$ . openbmc-env
> 	$ bitbake obmc-phosphor-image
> 
> I did not make any further changes to make sure I am using a default build.
> 
> I am getting an issue when compiling "intel-ipmi-oem" the errors I get 
> involve include files that can't be found:
> 
> DEBUG: Executing shell function do_compile
> NOTE: VERBOSE=1 cmake --build /home/wiv/openbmc-2.6.0/build/tmp/work/
> armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/
> build --target all -- -j 4
> [1/6] /home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-
> gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/recipe-sysroot-
> native/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++  
> -DBOOST_ALL_NO_LIB -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_NO_RTTI -
> DBOOST_NO_TYPEID -DBOOST_SYSTEM_NO_DEPRECATED -Dzinteloemcmds_EXPORTS -
> I/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/git/include -march=armv6 -
> marm -mtune=arm1176jz-s  --sysroot=/home/wiv/openbmc-2.6.0/build/tmp/
> work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +f426f334c6-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-
> types -fdebug-prefix-map=/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-
> openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0=/usr/
> src/debug/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0 -fdebug-prefix-
> map=/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/recipe-sysroot= -fdebug-
> prefix-map=/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-
> gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/recipe-sysroot-
> native=  -fvisibility-inlines-hidden  -march=armv6 -marm -
> mtune=arm1176jz-s  --sysroot=/home/wiv/openbmc-2.6.0/build/tmp/work/
> armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/
> recipe-sysroot -fPIC   -std=gnu++17 -MD -MT CMakeFiles/
> zinteloemcmds.dir/src/utils.cpp.o -MF CMakeFiles/zinteloemcmds.dir/src/
> utils.cpp.o.d -o CMakeFiles/zinteloemcmds.dir/src/utils.cpp.o -c /home/
> wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-
> oem/0.1+gitAUTOINC+f426f334c6-r0/git/src/utils.cpp
> FAILED: CMakeFiles/zinteloemcmds.dir/src/utils.cpp.o 
> /home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/recipe-sysroot-native/usr/
> bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++  -
> DBOOST_ALL_NO_LIB -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_NO_RTTI -
> DBOOST_NO_TYPEID -DBOOST_SYSTEM_NO_DEPRECATED -Dzinteloemcmds_EXPORTS -
> I/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/git/include -march=armv6 -
> marm -mtune=arm1176jz-s  --sysroot=/home/wiv/openbmc-2.6.0/build/tmp/
> work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +f426f334c6-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-
> types -fdebug-prefix-map=/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-
> openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0=/usr/
> src/debug/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0 -fdebug-prefix-
> map=/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/recipe-sysroot= -fdebug-
> prefix-map=/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-
> gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/recipe-sysroot-
> native=  -fvisibility-inlines-hidden  -march=armv6 -marm -
> mtune=arm1176jz-s  --sysroot=/home/wiv/openbmc-2.6.0/build/tmp/work/
> armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/
> recipe-sysroot -fPIC   -std=gnu++17 -MD -MT CMakeFiles/
> zinteloemcmds.dir/src/utils.cpp.o -MF CMakeFiles/zinteloemcmds.dir/src/
> utils.cpp.o.d -o CMakeFiles/zinteloemcmds.dir/src/utils.cpp.o -c /home/
> wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-
> oem/0.1+gitAUTOINC+f426f334c6-r0/git/src/utils.cpp
> /home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/git/src/utils.cpp:1:10: 
> fatal error: phosphor-ipmi-host/utils.hpp: No such file or directory
>  #include "phosphor-ipmi-host/utils.hpp"
>           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> [2/6] /home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-
> gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/recipe-sysroot-
> native/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++  
> -DBOOST_ALL_NO_LIB -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_NO_RTTI -
> DBOOST_NO_TYPEID -DBOOST_SYSTEM_NO_DEPRECATED -Dzinteloemcmds_EXPORTS -
> I/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/git/include -march=armv6 -
> marm -mtune=arm1176jz-s  --sysroot=/home/wiv/openbmc-2.6.0/build/tmp/
> work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +f426f334c6-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-
> types -fdebug-prefix-map=/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-
> openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0=/usr/
> src/debug/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0 -fdebug-prefix-
> map=/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/recipe-sysroot= -fdebug-
> prefix-map=/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-
> gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/recipe-sysroot-
> native=  -fvisibility-inlines-hidden  -march=armv6 -marm -
> mtune=arm1176jz-s  --sysroot=/home/wiv/openbmc-2.6.0/build/tmp/work/
> armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/
> recipe-sysroot -fPIC   -std=gnu++17 -MD -MT CMakeFiles/
> zinteloemcmds.dir/src/oemcommands.cpp.o -MF CMakeFiles/
> zinteloemcmds.dir/src/oemcommands.cpp.o.d -o CMakeFiles/
> zinteloemcmds.dir/src/oemcommands.cpp.o -c /home/wiv/openbmc-2.6.0/
> build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +f426f334c6-r0/git/src/oemcommands.cpp
> FAILED: CMakeFiles/zinteloemcmds.dir/src/oemcommands.cpp.o 
> /home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/recipe-sysroot-native/usr/
> bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++  -
> DBOOST_ALL_NO_LIB -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_NO_RTTI -
> DBOOST_NO_TYPEID -DBOOST_SYSTEM_NO_DEPRECATED -Dzinteloemcmds_EXPORTS -
> I/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/git/include -march=armv6 -
> marm -mtune=arm1176jz-s  --sysroot=/home/wiv/openbmc-2.6.0/build/tmp/
> work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +f426f334c6-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-
> types -fdebug-prefix-map=/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-
> openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0=/usr/
> src/debug/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0 -fdebug-prefix-
> map=/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/recipe-sysroot= -fdebug-
> prefix-map=/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-
> gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/recipe-sysroot-
> native=  -fvisibility-inlines-hidden  -march=armv6 -marm -
> mtune=arm1176jz-s  --sysroot=/home/wiv/openbmc-2.6.0/build/tmp/work/
> armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/
> recipe-sysroot -fPIC   -std=gnu++17 -MD -MT CMakeFiles/
> zinteloemcmds.dir/src/oemcommands.cpp.o -MF CMakeFiles/
> zinteloemcmds.dir/src/oemcommands.cpp.o.d -o CMakeFiles/
> zinteloemcmds.dir/src/oemcommands.cpp.o -c /home/wiv/openbmc-2.6.0/
> build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +f426f334c6-r0/git/src/oemcommands.cpp
> /home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/git/src/
> oemcommands.cpp:25:10: fatal error: phosphor-ipmi-host/utils.hpp: No 
> such file or directory
>  #include <phosphor-ipmi-host/utils.hpp>
>           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> [3/6] /home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-
> gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/recipe-sysroot-
> native/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++  
> -DBOOST_ALL_NO_LIB -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_NO_RTTI -
> DBOOST_NO_TYPEID -DBOOST_SYSTEM_NO_DEPRECATED -Dzinteloemcmds_EXPORTS -
> I/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/git/include -march=armv6 -
> marm -mtune=arm1176jz-s  --sysroot=/home/wiv/openbmc-2.6.0/build/tmp/
> work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +f426f334c6-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-
> types -fdebug-prefix-map=/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-
> openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0=/usr/
> src/debug/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0 -fdebug-prefix-
> map=/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/recipe-sysroot= -fdebug-
> prefix-map=/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-
> gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/recipe-sysroot-
> native=  -fvisibility-inlines-hidden  -march=armv6 -marm -
> mtune=arm1176jz-s  --sysroot=/home/wiv/openbmc-2.6.0/build/tmp/work/
> armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/
> recipe-sysroot -fPIC   -std=gnu++17 -MD -MT CMakeFiles/
> zinteloemcmds.dir/src/storagecommands.cpp.o -MF CMakeFiles/
> zinteloemcmds.dir/src/storagecommands.cpp.o.d -o CMakeFiles/
> zinteloemcmds.dir/src/storagecommands.cpp.o -c /home/wiv/openbmc-2.6.0/
> build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +f426f334c6-r0/git/src/storagecommands.cpp
> FAILED: CMakeFiles/zinteloemcmds.dir/src/storagecommands.cpp.o 
> /home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/recipe-sysroot-native/usr/
> bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++  -
> DBOOST_ALL_NO_LIB -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_NO_RTTI -
> DBOOST_NO_TYPEID -DBOOST_SYSTEM_NO_DEPRECATED -Dzinteloemcmds_EXPORTS -
> I/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/git/include -march=armv6 -
> marm -mtune=arm1176jz-s  --sysroot=/home/wiv/openbmc-2.6.0/build/tmp/
> work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +f426f334c6-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-
> types -fdebug-prefix-map=/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-
> openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0=/usr/
> src/debug/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0 -fdebug-prefix-
> map=/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/recipe-sysroot= -fdebug-
> prefix-map=/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-
> gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/recipe-sysroot-
> native=  -fvisibility-inlines-hidden  -march=armv6 -marm -
> mtune=arm1176jz-s  --sysroot=/home/wiv/openbmc-2.6.0/build/tmp/work/
> armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/
> recipe-sysroot -fPIC   -std=gnu++17 -MD -MT CMakeFiles/
> zinteloemcmds.dir/src/storagecommands.cpp.o -MF CMakeFiles/
> zinteloemcmds.dir/src/storagecommands.cpp.o.d -o CMakeFiles/
> zinteloemcmds.dir/src/storagecommands.cpp.o -c /home/wiv/openbmc-2.6.0/
> build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +f426f334c6-r0/git/src/storagecommands.cpp
> In file included from /home/wiv/openbmc-2.6.0/build/tmp/work/armv6-
> openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/git/
> src/storagecommands.cpp:25:
> /home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/git/include/
> storagecommands.hpp:19:10: fatal error: phosphor-ipmi-host/
> sensorhandler.hpp: No such file or directory
>  #include <phosphor-ipmi-host/sensorhandler.hpp>
>           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> [4/6] /home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-
> gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/recipe-sysroot-
> native/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++  
> -DBOOST_ALL_NO_LIB -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_NO_RTTI -
> DBOOST_NO_TYPEID -DBOOST_SYSTEM_NO_DEPRECATED -Dzinteloemcmds_EXPORTS -
> I/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/git/include -march=armv6 -
> marm -mtune=arm1176jz-s  --sysroot=/home/wiv/openbmc-2.6.0/build/tmp/
> work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +f426f334c6-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-
> types -fdebug-prefix-map=/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-
> openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0=/usr/
> src/debug/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0 -fdebug-prefix-
> map=/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/recipe-sysroot= -fdebug-
> prefix-map=/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-
> gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/recipe-sysroot-
> native=  -fvisibility-inlines-hidden  -march=armv6 -marm -
> mtune=arm1176jz-s  --sysroot=/home/wiv/openbmc-2.6.0/build/tmp/work/
> armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/
> recipe-sysroot -fPIC   -std=gnu++17 -MD -MT CMakeFiles/
> zinteloemcmds.dir/src/sensorcommands.cpp.o -MF CMakeFiles/
> zinteloemcmds.dir/src/sensorcommands.cpp.o.d -o CMakeFiles/
> zinteloemcmds.dir/src/sensorcommands.cpp.o -c /home/wiv/openbmc-2.6.0/
> build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +f426f334c6-r0/git/src/sensorcommands.cpp
> FAILED: CMakeFiles/zinteloemcmds.dir/src/sensorcommands.cpp.o 
> /home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/recipe-sysroot-native/usr/
> bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++  -
> DBOOST_ALL_NO_LIB -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_NO_RTTI -
> DBOOST_NO_TYPEID -DBOOST_SYSTEM_NO_DEPRECATED -Dzinteloemcmds_EXPORTS -
> I/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/git/include -march=armv6 -
> marm -mtune=arm1176jz-s  --sysroot=/home/wiv/openbmc-2.6.0/build/tmp/
> work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +f426f334c6-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-
> types -fdebug-prefix-map=/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-
> openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0=/usr/
> src/debug/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0 -fdebug-prefix-
> map=/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/recipe-sysroot= -fdebug-
> prefix-map=/home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-
> gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/recipe-sysroot-
> native=  -fvisibility-inlines-hidden  -march=armv6 -marm -
> mtune=arm1176jz-s  --sysroot=/home/wiv/openbmc-2.6.0/build/tmp/work/
> armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/
> recipe-sysroot -fPIC   -std=gnu++17 -MD -MT CMakeFiles/
> zinteloemcmds.dir/src/sensorcommands.cpp.o -MF CMakeFiles/
> zinteloemcmds.dir/src/sensorcommands.cpp.o.d -o CMakeFiles/
> zinteloemcmds.dir/src/sensorcommands.cpp.o -c /home/wiv/openbmc-2.6.0/
> build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +f426f334c6-r0/git/src/sensorcommands.cpp
> /home/wiv/openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+f426f334c6-r0/git/src/
> sensorcommands.cpp:25:10: fatal error: phosphor-ipmi-host/utils.hpp: No 
> such file or directory
>  #include <phosphor-ipmi-host/utils.hpp>
>           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> ninja: build stopped: subcommand failed.
> WARNING: exit code 1 from a shell command.
> ERROR: Function failed: do_compile (log file is located at /home/wiv/
> openbmc-2.6.0/build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/
> 0.1+gitAUTOINC+f426f334c6-r0/temp/log.do_compile.28169)
> 
> 
> For referece, when using the head I got this:
> 
> 
> DEBUG: Executing shell function do_compile
> NOTE: VERBOSE=1 cmake --build /home/wiv/openbmc/build/tmp/work/armv6-
> openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+c04e2e70d3-r0/build 
> --target all -- -j 4
> [1/6] /home/wiv/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+c04e2e70d3-r0/recipe-sysroot-native/usr/
> bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++  -
> DBOOST_ALL_NO_LIB -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_NO_RTTI -
> DBOOST_NO_TYPEID -DBOOST_SYSTEM_NO_DEPRECATED -Dzinteloemcmds_EXPORTS -
> I/home/wiv/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/intel-
> ipmi-oem/0.1+gitAUTOINC+c04e2e70d3-r0/git/include -march=armv6 -marm -
> mtune=arm1176jz-s  --sysroot=/home/wiv/openbmc/build/tmp/work/armv6-
> openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+c04e2e70d3-r0/
> recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-
> prefix-map=/home/wiv/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+c04e2e70d3-r0=/usr/src/debug/intel-ipmi-
> oem/0.1+gitAUTOINC+c04e2e70d3-r0 -fdebug-prefix-map=/home/wiv/openbmc/
> build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +c04e2e70d3-r0/recipe-sysroot= -fdebug-prefix-map=/home/wiv/openbmc/
> build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +c04e2e70d3-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -
> march=armv6 -marm -mtune=arm1176jz-s  --sysroot=/home/wiv/openbmc/build/
> tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +c04e2e70d3-r0/recipe-sysroot -fPIC   -std=gnu++17 -MD -MT CMakeFiles/
> zinteloemcmds.dir/src/storagecommands.cpp.o -MF CMakeFiles/
> zinteloemcmds.dir/src/storagecommands.cpp.o.d -o CMakeFiles/
> zinteloemcmds.dir/src/storagecommands.cpp.o -c /home/wiv/openbmc/build/
> tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +c04e2e70d3-r0/git/src/storagecommands.cpp
> FAILED: CMakeFiles/zinteloemcmds.dir/src/storagecommands.cpp.o 
> /home/wiv/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-
> oem/0.1+gitAUTOINC+c04e2e70d3-r0/recipe-sysroot-native/usr/bin/arm-
> openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++  -DBOOST_ALL_NO_LIB 
> -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_NO_RTTI -DBOOST_NO_TYPEID -
> DBOOST_SYSTEM_NO_DEPRECATED -Dzinteloemcmds_EXPORTS -I/home/wiv/openbmc/
> build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +c04e2e70d3-r0/git/include -march=armv6 -marm -mtune=arm1176jz-s  --
> sysroot=/home/wiv/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+c04e2e70d3-r0/recipe-sysroot  -O2 -pipe -g 
> -feliminate-unused-debug-types -fdebug-prefix-map=/home/wiv/openbmc/
> build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +c04e2e70d3-r0=/usr/src/debug/intel-ipmi-oem/0.1+gitAUTOINC+c04e2e70d3-
> r0 -fdebug-prefix-map=/home/wiv/openbmc/build/tmp/work/armv6-openbmc-
> linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+c04e2e70d3-r0/recipe-
> sysroot= -fdebug-prefix-map=/home/wiv/openbmc/build/tmp/work/armv6-
> openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+c04e2e70d3-r0/
> recipe-sysroot-native=  -fvisibility-inlines-hidden  -march=armv6 -marm 
> -mtune=arm1176jz-s  --sysroot=/home/wiv/openbmc/build/tmp/work/armv6-
> openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+c04e2e70d3-r0/
> recipe-sysroot -fPIC   -std=gnu++17 -MD -MT CMakeFiles/
> zinteloemcmds.dir/src/storagecommands.cpp.o -MF CMakeFiles/
> zinteloemcmds.dir/src/storagecommands.cpp.o.d -o CMakeFiles/
> zinteloemcmds.dir/src/storagecommands.cpp.o -c /home/wiv/openbmc/build/
> tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +c04e2e70d3-r0/git/src/storagecommands.cpp
> /home/wiv/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-
> oem/0.1+gitAUTOINC+c04e2e70d3-r0/git/src/storagecommands.cpp:23:10: 
> fatal error: phosphor-ipmi-host/selutility.hpp: No such file or 
> directory
>  #include <phosphor-ipmi-host/selutility.hpp>
>           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> [2/6] /home/wiv/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+c04e2e70d3-r0/recipe-sysroot-native/usr/
> bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++  -
> DBOOST_ALL_NO_LIB -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_NO_RTTI -
> DBOOST_NO_TYPEID -DBOOST_SYSTEM_NO_DEPRECATED -Dzinteloemcmds_EXPORTS -
> I/home/wiv/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/intel-
> ipmi-oem/0.1+gitAUTOINC+c04e2e70d3-r0/git/include -march=armv6 -marm -
> mtune=arm1176jz-s  --sysroot=/home/wiv/openbmc/build/tmp/work/armv6-
> openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+c04e2e70d3-r0/
> recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-
> prefix-map=/home/wiv/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+c04e2e70d3-r0=/usr/src/debug/intel-ipmi-
> oem/0.1+gitAUTOINC+c04e2e70d3-r0 -fdebug-prefix-map=/home/wiv/openbmc/
> build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +c04e2e70d3-r0/recipe-sysroot= -fdebug-prefix-map=/home/wiv/openbmc/
> build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +c04e2e70d3-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -
> march=armv6 -marm -mtune=arm1176jz-s  --sysroot=/home/wiv/openbmc/build/
> tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +c04e2e70d3-r0/recipe-sysroot -fPIC   -std=gnu++17 -MD -MT CMakeFiles/
> zinteloemcmds.dir/src/oemcommands.cpp.o -MF CMakeFiles/
> zinteloemcmds.dir/src/oemcommands.cpp.o.d -o CMakeFiles/
> zinteloemcmds.dir/src/oemcommands.cpp.o -c /home/wiv/openbmc/build/tmp/
> work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +c04e2e70d3-r0/git/src/oemcommands.cpp
> [3/6] /home/wiv/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+c04e2e70d3-r0/recipe-sysroot-native/usr/
> bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++  -
> DBOOST_ALL_NO_LIB -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_NO_RTTI -
> DBOOST_NO_TYPEID -DBOOST_SYSTEM_NO_DEPRECATED -Dzinteloemcmds_EXPORTS -
> I/home/wiv/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/intel-
> ipmi-oem/0.1+gitAUTOINC+c04e2e70d3-r0/git/include -march=armv6 -marm -
> mtune=arm1176jz-s  --sysroot=/home/wiv/openbmc/build/tmp/work/armv6-
> openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+c04e2e70d3-r0/
> recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-
> prefix-map=/home/wiv/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+c04e2e70d3-r0=/usr/src/debug/intel-ipmi-
> oem/0.1+gitAUTOINC+c04e2e70d3-r0 -fdebug-prefix-map=/home/wiv/openbmc/
> build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +c04e2e70d3-r0/recipe-sysroot= -fdebug-prefix-map=/home/wiv/openbmc/
> build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +c04e2e70d3-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -
> march=armv6 -marm -mtune=arm1176jz-s  --sysroot=/home/wiv/openbmc/build/
> tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +c04e2e70d3-r0/recipe-sysroot -fPIC   -std=gnu++17 -MD -MT CMakeFiles/
> zinteloemcmds.dir/src/utils.cpp.o -MF CMakeFiles/zinteloemcmds.dir/src/
> utils.cpp.o.d -o CMakeFiles/zinteloemcmds.dir/src/utils.cpp.o -c /home/
> wiv/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/
> 0.1+gitAUTOINC+c04e2e70d3-r0/git/src/utils.cpp
> [4/6] /home/wiv/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+c04e2e70d3-r0/recipe-sysroot-native/usr/
> bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++  -
> DBOOST_ALL_NO_LIB -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_NO_RTTI -
> DBOOST_NO_TYPEID -DBOOST_SYSTEM_NO_DEPRECATED -Dzinteloemcmds_EXPORTS -
> I/home/wiv/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/intel-
> ipmi-oem/0.1+gitAUTOINC+c04e2e70d3-r0/git/include -march=armv6 -marm -
> mtune=arm1176jz-s  --sysroot=/home/wiv/openbmc/build/tmp/work/armv6-
> openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+c04e2e70d3-r0/
> recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-
> prefix-map=/home/wiv/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/
> intel-ipmi-oem/0.1+gitAUTOINC+c04e2e70d3-r0=/usr/src/debug/intel-ipmi-
> oem/0.1+gitAUTOINC+c04e2e70d3-r0 -fdebug-prefix-map=/home/wiv/openbmc/
> build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +c04e2e70d3-r0/recipe-sysroot= -fdebug-prefix-map=/home/wiv/openbmc/
> build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +c04e2e70d3-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -
> march=armv6 -marm -mtune=arm1176jz-s  --sysroot=/home/wiv/openbmc/build/
> tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +c04e2e70d3-r0/recipe-sysroot -fPIC   -std=gnu++17 -MD -MT CMakeFiles/
> zinteloemcmds.dir/src/sensorcommands.cpp.o -MF CMakeFiles/
> zinteloemcmds.dir/src/sensorcommands.cpp.o.d -o CMakeFiles/
> zinteloemcmds.dir/src/sensorcommands.cpp.o -c /home/wiv/openbmc/build/
> tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC
> +c04e2e70d3-r0/git/src/sensorcommands.cpp
> ninja: build stopped: subcommand failed.
> WARNING: exit code 1 from a shell command.
> ERROR: Function failed: do_compile (log file is located at /home/wiv/
> openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/
> 0.1+gitAUTOINC+c04e2e70d3-r0/temp/log.do_compile.15661) 
> 
> 
> I hope this is sufficient to take things further.

Thanks for providing the extra details. I understand you and James have
sorted things out though, so we'll leave it there :)

Cheers

Andrew

Return-Path: <chyishian.jiang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=chyishian.jiang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rRKEJ0qi"; 
 dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 436Y6J1QT0zDrBg
 for <openbmc@lists.ozlabs.org>; Sun,  2 Dec 2018 01:09:27 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id c72so4210235pfc.6
 for <openbmc@lists.ozlabs.org>; Sat, 01 Dec 2018 06:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version; bh=j64JRoKuYOnd6YpprB+5a9kQr75jPcHD+sV/sRC2pT0=;
 b=rRKEJ0qi5WepBjMQn8V8wtWj7ut649SNGENVXsDG2S6DcmIP1zo1sHbhlSGvVyeaHn
 laoJMq8Xj+bSU5ufRC99W98vb36bsSYAy7U0ijv/wkIZSTMeC8oXhVONKgXgPqrlsMdW
 hJV3/O8nmAtz95GyU+ytFAbTOa/GAWMnYl1F9DZvafKfrRDF43y6DKbHSm+jiNY4AltZ
 FEcICOiDRRphmuVA8zAog871+Qu7BCsMSHq1kAwjOfpK2o+b6wakPFCz2yFAZgjliypA
 tv/3qTiQR43CjvFX3y++FKuAFb85M7eytznCNMv76/fxtZfa0o5cc6Np7RaSk/k9ogNU
 L+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version;
 bh=j64JRoKuYOnd6YpprB+5a9kQr75jPcHD+sV/sRC2pT0=;
 b=sHQuWDsFr0w+adTz9yJOo6ZKLQCG4uIK0BhNDN05JKmGe1mzUw1InVaRK6rMZhL8tW
 3GYcIH8PWb4Gk5NLlD3T9j68kx9/J3TPCBhv/nnFVSiaqufrUe5MCugUixvIHxss+lQ8
 tNnwGCiSzaGhgfPtEf9nZZF+vxagJ/yP6S2UMoIm5XkJatkww1NZSw02jcjsun5ISgpF
 3h1a0g9FPMKsgu60Z6/qFMj/+bGAmfqGYc1vtceusx6Kb2cCeu04jwyzjZ/Yc6lwnkbn
 vuUcNIBfQ/oCLe/deawS774HAFyChe+KDFbPktwkxLtgAOYdup3FB0/b3xnHBdypDMpA
 Ehsg==
X-Gm-Message-State: AA+aEWYKKYGDjIdtrLDcIWbWiphAES/Pn1u1OQNMNAiVv/LR/WyPYMxn
 WTO+UjIx0Duxp6EfDhVtumY=
X-Google-Smtp-Source: AFSGD/WV2FuuZvanTU8PnP/h6ehpXMprZoXcWu4Azvfp5wPApYFoMMOgfHktUVIfSISkld7vYa6fBg==
X-Received: by 2002:a63:9a09:: with SMTP id o9mr7681182pge.94.1543673365416;
 Sat, 01 Dec 2018 06:09:25 -0800 (PST)
Received: from [192.168.2.104] (114-45-49-17.dynamic-ip.hinet.net.
 [114.45.49.17])
 by smtp.gmail.com with ESMTPSA id d18sm11062729pfj.47.2018.12.01.06.09.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 01 Dec 2018 06:09:24 -0800 (PST)
Date: Sat, 1 Dec 2018 22:09:08 +0800
From: Samuel Jiang <chyishian.jiang@gmail.com>
To: Vijay Khemka <vijaykhemka@fb.com>, qianlihu
 <wangzhiqiang8906@gmail.com>, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: "=?utf-8?Q?openbmc=40lists.ozlabs.org?=" <openbmc@lists.ozlabs.org>
Message-ID: <6bfff7cb-b814-462c-9f5c-31ea0c632dbf@Spark>
In-Reply-To: <b20d590b-be35-046e-26c2-2c1b2456309a@linux.intel.com>
References: <CAHkHK08zcycaqmg_Pkq=Oe+8xC8TBYsCoBGLA0CCwH0qvwicWg@mail.gmail.com>
 <3022407b-fa4e-9e80-2044-69dbf4f03586@linux.intel.com>
 <CAHkHK09Km5BVLdq7OMSwTLi05-KgDc8K8j9_+e1ewtGanyr4Tg@mail.gmail.com>
 <47558ef0-d8e9-de42-e1dd-be7293048a91@linux.intel.com>
 <A5419381-84F9-490A-8BF0-70C513741ECF@fb.com>
 <e63c758f-2eec-9e28-9381-4e28d2d8bb64@linux.intel.com>
 <4780f022-1c80-4b53-9eb1-0e3fe313c6a2@Spark>
 <db5cfcea-972d-2f50-05f4-266ab2c8f310@linux.intel.com>
 <87C3DCC8-F773-46A0-B8EC-5E3DC5E3983F@fb.com>
 <660c304f-60eb-f54a-f3b7-4d6d4481a96a@linux.intel.com>
 <A9318AC7-EE0E-4B84-84D1-A16695EE3FC0@fb.com>
 <b20d590b-be35-046e-26c2-2c1b2456309a@linux.intel.com>
Subject: Re: [HELP] ipmi-kcs didn't work
X-Readdle-Message-ID: 6bfff7cb-b814-462c-9f5c-31ea0c632dbf@Spark
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="5c029609_4bee5a5b_da85"
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
X-List-Received-Date: Sat, 01 Dec 2018 14:09:30 -0000

--5c029609_4bee5a5b_da85
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--5c029609_4bee5a5b_da85
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D=22http://www.w3.org/1999/xhtml=22>
<head>
<title></title>
</head>
<body>
</body>
</html>

--5c029609_4bee5a5b_da85--

Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aogEtF12"; 
 dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44SH4L4SFlzDqD9
 for <openbmc@lists.ozlabs.org>; Mon, 25 Mar 2019 12:39:30 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id d13so3867990qth.5
 for <openbmc@lists.ozlabs.org>; Sun, 24 Mar 2019 18:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=meqobS0NZ1xtYWm8W4JfsteHBhyhVqCrvkppT2aXufc=;
 b=aogEtF127dVIT/Dv5R2jEv+sLtLWQDi6ni8mZIgeQ/Ddb16D4m8v53/GhwmR84AL+J
 /9Ux86yOZHjdHOtJJ5Kh7WzYmmCIXeZly6ZF3etXioWxmkHCO98909/LrLFiTMxyPKXm
 GZYjueLXYzUsulGbjvaxzRnjfuVchqZsAUpptSDgmmDGkNJFAWmFiyJ/iCGhQrTFzyWD
 sfF0ZoyLglOwyP/TqwhRJtVyteuLAwvJ7v3354C9YomzD72STJgqHOzBfS/vpgzYa2eT
 Y+MmMiTjXdqyg4yGJqCCCuThx59lM/FBn7CwfJ9j99ppdvzo3z52Vo+rJqHEkIXowj1M
 VhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=meqobS0NZ1xtYWm8W4JfsteHBhyhVqCrvkppT2aXufc=;
 b=XoxF/kplh1L0/jMIeZ49uHh5BnzFRRvsla7QJdLVtBwBJYarvluAdTT6GcL/Ugr24G
 e3z7WJ/SqFz68rAgSD2fwBhKUJdjOl68l1C8I2KN/NY6aEMlMWH0PFT+UnJ/JcbBpEzL
 cWGNIJRILc5BOIc0Lotd+sS5rMjWnCQB8B7+2XkMsAOnfwwPY/MTtw5GdsR9m1KMAd5S
 sI24oy2OfM6FtxgVZT0AgXp01eI8FXmpcUdsw3y6ReWNtD+tucmeXZ4m2k1mS3mWL/fb
 hcvXQ8QarrVzx7u1Vkx0d6RHNSAadkxNHRiKV2IWJkW7MEClRI0ocUG35R4ypRdhFkwd
 OoOQ==
X-Gm-Message-State: APjAAAVULixlJTlfsvvy4RUMuMUIcjRYzn2nlZ61e+dyHYva/hLmqtWQ
 1fyQMmnF1EDedn/jubWQu7wPGF93K7RAIRVSxJE=
X-Google-Smtp-Source: APXvYqwCRPdj7efo+4s+FhyL8lP/p5tt3uK3pVEQaG2sDtN8bfAHVkuo4xQejPMFygDSMkMautzUAHIh302T3X9jaAM=
X-Received: by 2002:aed:3a62:: with SMTP id n89mr17409352qte.88.1553477966952; 
 Sun, 24 Mar 2019 18:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAG9c7cDQc=o_=vEFRAjRRq9bV2Fz6ZD7Osp+vkd2QRgxmGcXGg@mail.gmail.com>
 <bee0622c-8ae6-3db3-b7f7-9d48651cf907@linux.intel.com>
 <740E00DF-F233-41A1-B894-9DB98A9AD62A@fb.com>
In-Reply-To: <740E00DF-F233-41A1-B894-9DB98A9AD62A@fb.com>
From: Henbin Chang <henbinchang@gmail.com>
Date: Mon, 25 Mar 2019 09:39:15 +0800
Message-ID: <CAG9c7cAHLdfqDMjWRnqbpw=VcA5zX96Sx2tqJ5TOMw9mKU7X=w@mail.gmail.com>
Subject: Re: Some problems about FruDevice in the entity-manager
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: James Feist <james.feist@linux.intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000062fca40584e14659"
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
X-List-Received-Date: Mon, 25 Mar 2019 01:39:30 -0000

--00000000000062fca40584e14659
Content-Type: text/plain; charset="UTF-8"

Thanks for your response.

I also encountered another problem.

That's,  I found the content of 16-bit EEPROM through the combination of
the SMBUS APIs was not incorrect.

    /* This is for 16 bit addressing EEPROM device. First an offset
     * needs to be written before read data from a offset
     */
    int ret = i2c_smbus_write_byte_data(file, 0, low_addr);
    if (ret < 0)
    {
        return ret;
    }

    return i2c_smbus_read_i2c_block_data(file, high_addr, len, buf);

So I referred to i2c-tools to modify them.
And then I could see my FRU under the tree of
'xyz/openbmc_project/FruDevice/'

    int ret = i2c_smbus_write_byte_data(file, high_addr, low_addr);
    //int ret = i2c_smbus_write_byte_data(file, 0, low_addr);
    if (ret < 0)
    {
        return ret;
    }
    while (index < len){
buf[index] = i2c_smbus_read_byte(file);
index++;
    }

    //return i2c_smbus_read_i2c_block_data(file, high_addr, len, buf);
    return len;

Let me know if you have any comments.

Thanks.

--00000000000062fca40584e14659
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Thanks =
for your response.<div><br></div><div>I also encountered another problem.</=
div><div><br></div><div>That&#39;s,=C2=A0 I found the content of 16-bit EEP=
ROM through the=C2=A0combination of the SMBUS APIs was not incorrect.</div>=
<div><div><br></div><div>=C2=A0 =C2=A0 /* This is for 16 bit addressing EEP=
ROM device. First an offset</div><div>=C2=A0 =C2=A0 =C2=A0* needs to be wri=
tten before read data from a offset</div><div>=C2=A0 =C2=A0 =C2=A0*/</div><=
div>=C2=A0 =C2=A0 int ret =3D i2c_smbus_write_byte_data(file, 0, low_addr);=
</div><div>=C2=A0 =C2=A0 if (ret &lt; 0)</div><div>=C2=A0 =C2=A0 {</div><di=
v>=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;</div><div>=C2=A0 =C2=A0 }</div><d=
iv><br></div><div>=C2=A0 =C2=A0 return i2c_smbus_read_i2c_block_data(file, =
high_addr, len, buf);</div></div><div><br></div><div>So I referred to i2c-t=
ools to modify them.=C2=A0</div><div>And then I could see my FRU under the =
tree of &#39;xyz/openbmc_project/FruDevice/&#39;</div><div><br></div><div><=
div>=C2=A0 =C2=A0 int ret =3D i2c_smbus_write_byte_data(file, high_addr, lo=
w_addr);</div><div>=C2=A0 =C2=A0 //int ret =3D i2c_smbus_write_byte_data(fi=
le, 0, low_addr);</div><div>=C2=A0 =C2=A0 if (ret &lt; 0)</div><div>=C2=A0 =
=C2=A0 {</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;</div><div>=C2=A0=
 =C2=A0 }</div><div>=C2=A0 =C2=A0 while (index &lt; len){</div><div><span s=
tyle=3D"white-space:pre">	</span>buf[index] =3D i2c_smbus_read_byte(file);<=
/div><div><span style=3D"white-space:pre">	</span>index++;</div><div>=C2=A0=
 =C2=A0 }</div><div><br></div><div>=C2=A0 =C2=A0 //return i2c_smbus_read_i2=
c_block_data(file, high_addr, len, buf);</div><div>=C2=A0 =C2=A0 return len=
;</div></div><div><br></div><div>Let me know if you have any comments.</div=
><div><br></div><div>Thanks.</div></div></div></div></div>

--00000000000062fca40584e14659--

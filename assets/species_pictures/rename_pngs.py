#!/usr/bin/env python3
import os
import sys

def rename_pngs(prefix="spec_"):
    cwd = os.getcwd()
    print(f"🔍  Working directory: {cwd}")

    # Collect all .png/.PNG files
    png_files = sorted(
        f for f in os.listdir(cwd)
        if os.path.isfile(f) and f.lower().endswith('.png')
    )
    print(f"🖼️  Found {len(png_files)} PNG file(s): {png_files}")

    if not png_files:
        print("❗ No PNGs to rename. Exiting.")
        return

    for idx, old_name in enumerate(png_files):
        new_name = f"{prefix}{idx}.png"
        if old_name == new_name:
            print(f"⚠️  Skipping {old_name}, already named correctly.")
            continue

        # If target exists, you may want to avoid clobbering it:
        if os.path.exists(new_name):
            print(f"❗ Target name {new_name} already exists! Aborting.")
            sys.exit(1)

        print(f"🔄 Renaming {old_name} → {new_name}")
        os.rename(old_name, new_name)

    print("✅ Done renaming.")

if __name__ == "__main__":
    rename_pngs()

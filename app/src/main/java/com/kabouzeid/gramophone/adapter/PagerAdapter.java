package com.kabouzeid.gramophone.adapter;

import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.util.SparseArray;
import android.view.ViewGroup;

import com.kabouzeid.gramophone.R;
import com.kabouzeid.gramophone.ui.fragments.mainactivityfragments.AlbumViewFragment;
import com.kabouzeid.gramophone.ui.fragments.mainactivityfragments.ArtistViewFragment;
import com.kabouzeid.gramophone.ui.fragments.mainactivityfragments.PlaylistViewFragment;
import com.kabouzeid.gramophone.ui.fragments.mainactivityfragments.SongViewFragment;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class PagerAdapter extends FragmentPagerAdapter {

    private final SparseArray<WeakReference<Fragment>> mFragmentArray = new SparseArray<>();

    private final List<Holder> mHolderList = new ArrayList<>();

    private final Context mContext;

    private int mCurrentPage;

    private String[] titles;

    public PagerAdapter(final Context context, final FragmentManager fragmentManager) {
        super(fragmentManager);
        mContext = context;
        titles = new String[]{
                context.getResources().getString(R.string.songs),
                context.getResources().getString(R.string.albums),
                context.getResources().getString(R.string.artists),
                context.getResources().getString(R.string.playlists)
        };
    }

    @SuppressWarnings("synthetic-access")
    public void add(final Class<? extends Fragment> className, final Bundle params) {
        final Holder mHolder = new Holder();
        mHolder.mClassName = className.getName();
        mHolder.mParams = params;

        final int mPosition = mHolderList.size();
        mHolderList.add(mPosition, mHolder);
        notifyDataSetChanged();
    }

    public Fragment getFragment(final int position) {
        final WeakReference<Fragment> mWeakFragment = mFragmentArray.get(position);
        if (mWeakFragment != null && mWeakFragment.get() != null) {
            return mWeakFragment.get();
        }
        return getItem(position);
    }

    @Override
    public Object instantiateItem(final ViewGroup container, final int position) {
        final Fragment mFragment = (Fragment) super.instantiateItem(container, position);
        final WeakReference<Fragment> mWeakFragment = mFragmentArray.get(position);
        if (mWeakFragment != null) {
            mWeakFragment.clear();
        }
        mFragmentArray.put(position, new WeakReference<Fragment>(mFragment));
        return mFragment;
    }

    @Override
    public Fragment getItem(final int position) {
        final Holder mCurrentHolder = mHolderList.get(position);
        final Fragment mFragment = Fragment.instantiate(mContext,
                mCurrentHolder.mClassName, mCurrentHolder.mParams);
        return mFragment;
    }

    @Override
    public void destroyItem(final ViewGroup container, final int position, final Object object) {
        super.destroyItem(container, position, object);
        final WeakReference<Fragment> mWeakFragment = mFragmentArray.get(position);
        if (mWeakFragment != null) {
            mWeakFragment.clear();
        }
    }

    @Override
    public int getCount() {
        return mHolderList.size();
    }

    @Override
    public CharSequence getPageTitle(final int position) {
        return titles[position]
                .toUpperCase(Locale.getDefault());
    }

    public int getCurrentPage() {
        return mCurrentPage;
    }

    protected void setCurrentPage(final int currentPage) {
        mCurrentPage = currentPage;
    }

    public enum MusicFragments {
        SONG(SongViewFragment.class),
        ALBUM(AlbumViewFragment.class),
        ARTIST(ArtistViewFragment.class),
        PLAYLIST(PlaylistViewFragment.class);

        private Class<? extends Fragment> mFragmentClass;

        MusicFragments(final Class<? extends Fragment> fragmentClass) {
            mFragmentClass = fragmentClass;
        }

        public Class<? extends Fragment> getFragmentClass() {
            return mFragmentClass;
        }

    }

    private final static class Holder {
        String mClassName;

        Bundle mParams;
    }
}